Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1D03BE91F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 15:58:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKgxZ4HMxz3bkp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 23:58:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LSwG+ltb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LSwG+ltb; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKgx64sHRz302y
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 23:58:01 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id q10so2179164pfj.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jul 2021 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=y7xL37+wRygKUruADb7d35ysRYf/kHcND7rKwd7sRCg=;
 b=LSwG+ltb4yb+bmQ8BT2udXsnLoS4F1NFxJm4EvajAXZJRwCRrgEucrygvJ2ItOhzlr
 kqpXfeFoe4LV/nMRz8zvyZlamHeJaQ4NNtpV9uWD0KkgbfEPjmn5tXwIYIVWD0Zvyx/b
 qmlMoz8RbVM9seje67Q5Ej/hYTCWVtUn1ZhcEU+cYvSlu96kFvjgpwNRNBZd8vx36lCP
 axdFzyNDdwPDK5SM7+CHc/1bnVnXLG77AAGAsWrPqut6eTHyeR7DkMjlpB9HHpfkIidv
 DwwOcZXXJooxCfn+q3VLVDyBqxoahCl3/iKgTxFXLJm4Ra11A1X+q2dLKFbEqy1o0jEO
 V8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=y7xL37+wRygKUruADb7d35ysRYf/kHcND7rKwd7sRCg=;
 b=ricxL2+8de68ZF0aR3E5W0hlr/DQBkHpE4jvA0trFbpq0FW0hmd+edwvbcqPxKlIgL
 c3sgGF9QEoglQHWnALTgqU5Q/hK+h9OaumKnr0I4MFUaPFBnHyWBsIjNtBLT0M1NCVKM
 3WchlI6rfAD0Dno5ljj+LcGEOOmvs2IWTNtnmAqha4TV5OgCZQKGVfXejpnHUZPLEdPH
 n754Uw0VRg+1xHjWRTjly5ytrbkRzBWUGFaLjy5SCjViK6saNJNvu18LD87z5cS59926
 oKCRONQmCvqUwPCj/tzY9nNGYbVM8iLUVkv65xGlj7hwjIftwDktGwYMfyCfDibQR3D3
 OqZg==
X-Gm-Message-State: AOAM532kVHreFLly9bn834+qKPNFeLCm/ODIQuPbGDNI2vlsrRPNkpJO
 n+yYyqMkD+9ICpC16/wlc1//8KdmcCM=
X-Google-Smtp-Source: ABdhPJyF5GrjpvOZiBtmF9Bmh8/qpLdQRa+UHdAi0idEJ/9z/my5D6u/5vbGOFqg2+OxnPkLdcD3OQ==
X-Received: by 2002:aa7:80d9:0:b029:2ed:49fa:6dc5 with SMTP id
 a25-20020aa780d90000b02902ed49fa6dc5mr25560648pfn.3.1625666277416; 
 Wed, 07 Jul 2021 06:57:57 -0700 (PDT)
Received: from localhost (14-203-186-173.tpgi.com.au. [14.203.186.173])
 by smtp.gmail.com with ESMTPSA id e18sm15715332pfc.85.2021.07.07.06.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 06:57:57 -0700 (PDT)
Date: Wed, 07 Jul 2021 23:57:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc: flexible register range save/restore macros
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210703091452.352816-1-npiggin@gmail.com>
 <dc76505a-dbb3-ba3b-651e-32bcacd64d28@csgroup.eu>
In-Reply-To: <dc76505a-dbb3-ba3b-651e-32bcacd64d28@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1625666256.bfohvdbguf.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of July 5, 2021 3:52 pm:
>=20
>=20
> Le 03/07/2021 =C3=A0 11:14, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Introduce macros that operate on a (start, end) range of registers,
>> which reduces lines of code and need to do mental arithmetic while
>> reading the code.
>=20
> Looks like a nice patch.
>=20
> Maybe you could split the patch in two parts, one part for GPRs and one p=
atch for the FP/VR regs.

Sure I can do that.

Thanks,
Nick
