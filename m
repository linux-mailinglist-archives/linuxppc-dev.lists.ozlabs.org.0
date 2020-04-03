Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4C19D15D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:38:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tsHg6pr5zDqwT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DIpxYzwc; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tsB50YKNzF0Rt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:33:48 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id n10so3093723pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=6eTQPyddv5f9SRxTrCu1HpU/mZFl02NaYZhT7ltXJvM=;
 b=DIpxYzwc7IBK/NsPfM0wzUov+Iv1OcKRReEWjT2bmDGtKez3CWY5TXWaIQMzsoUgtU
 NIClVMRucU+ZGL4X3rND3J/Sv5+cPTJGKLNhRuL3g/1jq+O1PnA/AbdgkxCOxux7Z3Ee
 05BisU9HXpM13G6inAt73sB+MxkGslDj0WX6KeoUU+IK+CfqfE6CThK5m87JlMCwcMR9
 2n+z65y9hXathwW164UwoutNkcR83FebyA7fsHe1SZDx9fleqlPOOR4/YEvT+FHHHNF1
 NUMWfJ0JwslkFzifHLGMtNoO2YqvXlAohajKqffSl0TVy4OxM3oldUugnckD5X2nPYHW
 qMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=6eTQPyddv5f9SRxTrCu1HpU/mZFl02NaYZhT7ltXJvM=;
 b=DNnb5dEJ+gaUxSE9TzwHM4hqYMdH2iRIVsJeW1cGz/rKk17aJ6sNk7+0JIqWkjD8cL
 5/fh6qAUgy+BJFeuquzKHkEp2atuanU1or85iRi7NxPOBlyXzqBOCEOyb95CqkSjTMUd
 JET1limpoJ4JYQaDH0HKMy6j1lx9pFKBRTjhjHfX4TuTgGWZXdKYNwAbqso8VQgZXSml
 /x8VNcEkMF76oJuBLyvXWsz7PCLs6kQAl9qjvZnrVe6o8W8BmO8sveXobYVELJ+ZRbth
 lwOFpEXmuWAuaoxIPetch6dQz/B9eXo6XEiq3ChkQXShJu3qvimVWbFNd8G9E1AZNSpm
 uzaQ==
X-Gm-Message-State: AGi0PuYnF0CRhlpcrgGELEQVrPJSxxGmdelWBo5INPmKVbgUWFyNUszr
 1p/ibYU0GzDgvs/Dc99XaEE=
X-Google-Smtp-Source: APiQypI0pCTSglQqiqf6qQwJ44I91xTYmtj4PFApCZx7Y0Y3z+lHknCzOY64l1KScrStsuRgDAWPZg==
X-Received: by 2002:aa7:9f42:: with SMTP id h2mr6792832pfr.22.1585899225368;
 Fri, 03 Apr 2020 00:33:45 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id h4sm4750410pgg.67.2020.04.03.00.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 00:33:44 -0700 (PDT)
Date: Fri, 03 Apr 2020 17:33:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC WIP PATCH] powerpc/32: system call implement entry/exit
 logic in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <bbc0a09cfaf523bc00893253a7101362c98b31eb.1585667934.git.christophe.leroy@c-s.fr>
 <059c1abd-6be2-25ea-83e0-dcd411b7951b@c-s.fr>
In-Reply-To: <059c1abd-6be2-25ea-83e0-dcd411b7951b@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585898897.1jwur86s6a.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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

Christophe Leroy's on April 1, 2020 9:48 pm:
>=20
>=20
> Le 31/03/2020 =C3=A0 17:22, Christophe Leroy a =C3=A9crit=C2=A0:
>> That's first try to port PPC64 syscall entry/exit logic in C to PPC32.
>> I've do the minimum to get it work. I have not reworked calls
>> to sys_fork() and friends for instance.
>>=20
>> For the time being, it seems to work more or less but:
>> - ping reports EINVAL on recvfrom
>> - strace shows NULL instead of strings in call like open() for instance.
>=20
> For the two above problems, that's because system_call_exception()=20
> doesn't set orig_gpr3 whereas DoSycall() does in entry_32.S . Is that=20
> only done on PPC32 ?
>=20
> With the following line at the begining of system_call_exception(), it=20
> works perfectly:
>=20
> 	regs->orig_gpr3 =3D r3;

Oh great, nice work. We should be able to make some simple helpers or
move some things a bit to reduce the amount of ifdefs in the C code.
It doesn't look too bad though.

> I will now focus on performance to see if we can do something about it.

What's the performance difference between current asm code just with
always saving NVGPRS vs C?

Thanks,
Nick

=
