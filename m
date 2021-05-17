Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66D382599
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 09:44:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkB471TfFz3bTN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 17:44:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AwY2Ozni;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AwY2Ozni; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkB3k6KP8z2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 17:44:34 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 6so4067137pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=c//JpD/uYQv9efR4mX5SgFT+57KIyKuAcRKu4zsF6gg=;
 b=AwY2Ozni7GjWrpfCKsVhAkIlJVEeBY3N7MS4eGI0fBX1DoZbvWbZvbYb6YVV4NPHxe
 1woSPmyw5eHCf1Hpnk5S1+z0tKYZHLAb2nZR2qlf/ftP2uu5dUm3k++sAvI3T+ix+48h
 6D4lrvGd/xfGcgymTiGaceL85VFZKhRlNO6lAWlHwBJV7l+XapZJYr33qTvP/dn5o6bQ
 CGVzvjKDRPvGsPAsNajw6NBQ+4irtZMeoqFF8MuPP4+Ps1pTYU0AHBlQRcirPcUn0vOA
 jwoITmks4KPV5YX7lIeBkDlY8cIygGxprqPUcloWqMJqNN6z4vmFYP0rWuprhNB207qc
 P6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=c//JpD/uYQv9efR4mX5SgFT+57KIyKuAcRKu4zsF6gg=;
 b=JiMht6chC5W7kGOVMDlYwzzp3/9R8gnA8o1HJ7QP58BFvJYqUFARSf268h7UqUfxtk
 6bhrmKuxsz2A1Y13AxrrT0xgYJQZnPf0OYL/Iml+4PZBS8z31AmR2D4AmlnQ/ILNu3tc
 D2DdSfP/sqZGfCMAhavDEM2M2fo0kS3oJI6NWkEdGksEKEl6r+x88058aOT349LVdN5z
 rCcUtrCbwGUQ5pmkpHj3zhbNSP+cvvajCpVgHF1A5qo4Y7uG3kEyl6pEgysGDocbkpKb
 0QdT9FU+vR4vqgzNuJNH5Jr5XG4uMPmcMAAf9BvAV0+IZdZ4cvdyLasSjSbYmnfYMOeF
 gniw==
X-Gm-Message-State: AOAM532JmekP1w+frFZnhA2dEwPoAABbHyIIym4+aV2GwzENzng5b9ut
 Q/j6dlfq1Q7ya4coxz/GiOs=
X-Google-Smtp-Source: ABdhPJyh/K9tMM0ffPn7cD+k7NntE+uD9AsQ4kF8sI8UivDrFYNpogPyQ9yMUthC2xcnyr/TqP8UlA==
X-Received: by 2002:a63:2b82:: with SMTP id
 r124mr55505670pgr.324.1621237471270; 
 Mon, 17 May 2021 00:44:31 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id j17sm4322643pff.77.2021.05.17.00.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:44:31 -0700 (PDT)
Date: Mon, 17 May 2021 17:44:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/interrupt: Refactor
 interrupt_exit_user_prepare() and syscall_exit_prepare()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cd0634769e5fea397411a0f833db52749852c6f8.1620980916.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cd0634769e5fea397411a0f833db52749852c6f8.1620980916.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1621237386.33q9uyrpc3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of May 14, 2021 6:28 pm:
> Last part of interrupt_exit_user_prepare() and syscall_exit_prepare()
> are identical.
>=20
> Create a __interrupt_exit_user_prepare() function that is called by
> both.
>=20
> Note that it replaces a local_irq_save(flags) by local_irq_disable().
> This is similar because the flags are never used. On ppc 8xx it is
> more efficient because it doesn't require reading MSR.

Can these cleanups go after my interrupt performance improvements?
I posted them for last series but were dropped due to crashes without
time to resubmit. I'm working on them again now.

Thanks,
Nick
