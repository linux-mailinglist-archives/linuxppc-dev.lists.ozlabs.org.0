Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FB315CC2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:02:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db31j1qpFzDvVk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 13:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lOPNp9fF; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db2vw67KbzDsmQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 12:57:48 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id nm1so234383pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Feb 2021 17:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=oLW+n5w0pghmkNj2ep8nCPeAU0s26nQfvVVpmEbyunM=;
 b=lOPNp9fFMtEacEN782fXGeE95Kdh37rGdiUidWXHnY98Nrevlcw+Efy/0o211FTwMz
 1/kFVmyhObSCsMwK6dLGptAylcMJt4OpAvCw4NY8eYpiVQtloRdNjN3G5Qq0S7a4qOny
 vVoK+GoBEkiZm3n7N5h1ts/Kqn+0ExSl9hpvJ5EIIZzW8McWqME5U8Yf0FEMs+v7YvDB
 O8N153T+UN6Nuz80eM6/cXYdu2S1YbU2cmkczrjRlPjt8kIIDMEnWYIyqvn/EWWYTkCo
 S2G0EQzENA+dvh7xLhfgUDDFj5HddiRjZPMsIvn63nJgsJjGDn+T4QNlMlnKfyILkeMA
 kPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=oLW+n5w0pghmkNj2ep8nCPeAU0s26nQfvVVpmEbyunM=;
 b=Pj5kXtWDPJPDDST9eeq61HP3cRAhP45FgWbnMqXRvER7gRDbRptoh2a+eMFQyz6zv0
 c9HTLHet31ewCPGdawz0DXkQJtjuNih03K6eqSRwca3okUcAUEEaDJKatEFfHO/99HXd
 mo22k7Ns8zsCtMRVzCtSKmfwlKkD4brdBjoGfH4ll42vsm4DHQdrOGVHgMLNgtTDR+oj
 Wg5ylLI53tYSuDGnaFysWkvfUXWto1xG4dVwFQaZQgB8aKqFgLsrFHHiilqi+xPKCysb
 ym2feUfKISP/Gqc5bTP9ByDYHLi+ym94UzJzJKgN1Gtq/Y3UO1uxeeKhVnZ5li7mMddB
 zK+w==
X-Gm-Message-State: AOAM530FeLwKvIguDmqKNMPbPkVraPXbqTJE55n1JLe43FYUo7h3QcBw
 LgH+Y7pMletD/BuEEd0Ncok=
X-Google-Smtp-Source: ABdhPJzN+0Dc764xEdE636nOl2URQeFOcnQuIGS2ucB0THifofkFPCwdFUff0eCkTGWMDmfv5U+lWA==
X-Received: by 2002:a17:902:a5cb:b029:de:cd0b:1424 with SMTP id
 t11-20020a170902a5cbb02900decd0b1424mr647751plq.63.1612922266884; 
 Tue, 09 Feb 2021 17:57:46 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id b14sm185543pfi.74.2021.02.09.17.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 17:57:45 -0800 (PST)
Date: Wed, 10 Feb 2021 11:57:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 18/22] powerpc/syscall: Remove FULL_REGS verification
 in system_call_exception
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <6bef4d9ba0cba50160d13e344ee4627ebdf801dc.1612796617.git.christophe.leroy@csgroup.eu>
 <1612836023.l122pe2n2b.astroid@bobo.none>
 <cc1a35a4-07c3-9e64-18d6-57e497f56e33@csgroup.eu>
In-Reply-To: <cc1a35a4-07c3-9e64-18d6-57e497f56e33@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612922197.2b51jxzeqs.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 10, 2021 12:31 am:
>=20
>=20
> Le 09/02/2021 =C3=A0 03:02, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>>> For book3s/64, FULL_REGS() is 'true' at all time, so the test voids.
>>> For others, non volatile registers are saved inconditionally.
>>>
>>> So the verification is pointless.
>>>
>>> Should one fail to do it, it would anyway be caught by the
>>> CHECK_FULL_REGS() in copy_thread() as we have removed the
>>> special versions ppc_fork() and friends.
>>>
>>> null_syscall benchmark reduction 4 cycles (332 =3D> 328 cycles)
>>=20
>> I wonder if we rather make a CONFIG option for a bunch of these simpler
>> debug checks here (and also in interrupt exit, wrappers, etc) rather
>> than remove them entirely.
>=20
> We can drop this patch if you prefer. Anyway, like book3s/64, once ppc32 =
also do interrupt=20
> entry/exit in C, FULL_REGS() will already return true.

Sure let's do that.

Thanks,
Nick

