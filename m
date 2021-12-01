Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD64646ED
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 06:52:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3pC26HGSz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 16:52:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E94DBNzF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=E94DBNzF; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3pBN4tzjz2x9H
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 16:51:56 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso461041pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3+ix4WtXMbVX75afq6yOl61urhycIARKwGpxkJcu71c=;
 b=E94DBNzFDb3yOB7dm0HwlSaMqilM/31xhqbDk0nRfqRiJY2XnPo+aWqJDBEKycOwSt
 ipY6JM7jMSDsYY/PEy5GEyR+Ym+3TqeNoGZw36GfizaM/Xdn3lcd+3jLYkJuzb03tH1F
 54GS6JZcQX+r5maqMZJoivM3xK6WzNv7rErNWBjzlV+g4JojQZ5V2SBda1HHeFYOtX2W
 q3gat3zFEf7eJh1ZCnTevGyKOeWd7oIGcWaRetcj1kohDU50t3MZNTT2JSeM0tmySPuv
 V2TjbUy2w92EO0aJunmnR9fi3beIeuKURY9zNFmFzTRsJ/1gUd5Zcjm5ysIMJpLQ47BP
 BtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3+ix4WtXMbVX75afq6yOl61urhycIARKwGpxkJcu71c=;
 b=ZyMkzffHf9J1VplAHoJ4ZxzzBCzM86Khe28pl4AZwSSnrKkz6V/Or8DUTQ5caRBulc
 XGradZqOxX7e4BeQ8NTTxhbSbJ69Jp9eEKOe/JS/rI/y+Hp1ij6tgTNA77eYP4hYlJLr
 lSnXMp78+0TME/rUX+UxmzzSIR4BkbrU6xStjbz/Dj11Bm2luEdgEQ8UBw9pRDrpjTuw
 NUjRWPcKuy6Uxt8lDcWCl85n9Xg3LJlDnewU8jdU7l+QDeIBPO02l6+Auz1HQnoXKwnq
 ubA0YmDNmawiorqCfVSXt2XiaHja9uzOWbHFYIGapXR7xfa70bXC80tAALKvyCQ+1agK
 g/qA==
X-Gm-Message-State: AOAM5331ytMjoKxk8Q2pqMNru3X0Ogc1F8U9nzPJhV+SmGFH6kQ1pRHI
 0xR/LAzUQZXG0PCP8deEzdecag96S4Y=
X-Google-Smtp-Source: ABdhPJyBTLs29i3Nm0ZJQZf1rzLsZ/eEHdXJ5WxAgvONI2yxO4BZXAe8UGGxpDdVwTfh3Xkms1V28w==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr4810661pjb.49.1638337913937; 
 Tue, 30 Nov 2021 21:51:53 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id q11sm23262253pfk.192.2021.11.30.21.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 21:51:53 -0800 (PST)
Date: Wed, 01 Dec 2021 15:51:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 rebased 4/9] powerpc/mm: Remove asm/slice.h
To: alex@ghiti.fr, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
 <8ba40287876c2d6fe806b130f8c83b874f2469bb.1637862579.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8ba40287876c2d6fe806b130f8c83b874f2469bb.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1638337883.bumneai7t0.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 26, 2021 3:52 am:
> Move necessary stuff in asm/book3s/64/slice.h and
> remove asm/slice.h

Any reason to make this separate from patch 1?

Thanks,
Nick
