Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9904374A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbJlJ3kZKz3c9x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 20:22:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IK0PtPok;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IK0PtPok; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbJkd30sXz3bj5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 20:21:29 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so2571832pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=dGrOKBr3/fBsQ+t0W7CYdej3oIafzY0SboiqA+vKOow=;
 b=IK0PtPoklFdevzA7jaqBQStCoJNAsZQGPYBUYTlf3E+IG/ZgILYIBR0GuXQgHnv1Vy
 T+53dxHgFv3IodprXwEwyRgzVAlMPPdgTv7AhBxVta2lMJ8JIQpFSq4G2EGKPyFdjNWl
 8W6KJxDvCHS9qsuSwDBta6GTctDFL722R539+KDqmWSd83e/4C6TTTYLjz3PqWEb5qmb
 31LREA8QUIHRku2pAO4HRqvxvHThTNkf8pb144D1DhGp4xr5bx9EaE/o62qbzUaJg9xd
 Py1fqNd4otHWFULBCDF6/W7bQKgrQj58SI85V2uGUxoa05jXuNKn7gP8rOEBSWnH1Suu
 RQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dGrOKBr3/fBsQ+t0W7CYdej3oIafzY0SboiqA+vKOow=;
 b=RfGcFWhmeMdU4kvofiL5VPbymIkr7Oen5EcK2DLNkBTa+4wvU0mOp3SsYi44AV2O1k
 08veEqwa0Ltbfcz8TRU/FwG4SJ5J56Xu0rv4SmBGa97frdM3vUiOTNhsizVqkmgyesTC
 BNgP02o13Nv0t0PphkaY71dw6Cr2zBO224rZ//qEJNXBUJpgYBH8SfcbelNtWTeCbc5x
 TYCoHp9KUXo/bd9hyQA4XvuUOadursiCwFOVDMQQ+zuumKRWy+PvIiq/Dt4+kB3WHbtZ
 lJ525JMGOpDmHLOp24aimggrkMM2hONIyfSSfUBDoUN4jnxUmHYYq/elpJPFL6Kw6DAH
 ZTbQ==
X-Gm-Message-State: AOAM532AIJeNYPxFHZYLH4TQZMYz1QZb44a+cJOKsvAP55uEYsoQDF6C
 rdFtc3C1cf3azNMCnJ+muY/R92S5iSAAeA==
X-Google-Smtp-Source: ABdhPJxxvATHae4Rwl45ocXs5rXgNktCEVTbLpHQgGtUim3IZflaIEQR9kBujS8N/uWjMD41UK6QtQ==
X-Received: by 2002:a17:902:9a41:b0:140:4ca:761e with SMTP id
 x1-20020a1709029a4100b0014004ca761emr7118854plv.51.1634894487149; 
 Fri, 22 Oct 2021 02:21:27 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id i127sm8035110pgc.40.2021.10.22.02.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 02:21:26 -0700 (PDT)
Date: Fri, 22 Oct 2021 19:21:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 13/18] powerpc/64e: remove mmu_linear_psize
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-14-npiggin@gmail.com>
 <8e03d7e9-b56a-0d87-3852-b9c5099e1273@csgroup.eu>
In-Reply-To: <8e03d7e9-b56a-0d87-3852-b9c5099e1273@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634894404.wkeqyc93hf.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 22, 2021 4:49 pm:
>=20
>=20
> Le 22/10/2021 =C3=A0 00:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> mmu_linear_psize is only set at boot once on 64e, is not necessarily
>> the correct size of the linear map pages, and is never used anywhere.
>> Remove it.
>=20
> mmu_linear_psize is defined as a macro in:
>=20
>      arch/powerpc/include/asm/book3s/32/mmu-hash.h, line 152 (as a macro)
>      arch/powerpc/include/asm/nohash/32/mmu-40x.h, line 66 (as a macro)
>      arch/powerpc/include/asm/nohash/32/mmu-44x.h, line 150 (as a macro)
>      arch/powerpc/include/asm/nohash/32/mmu-8xx.h, line 173 (as a macro)
>=20
> Is that needed at all or should is be cleaned, if nothing else than 64s=20
> uses it ?
>=20
> Otherwise, why not do the same with 64e and define it as a macro ? Maybe=20
> that would help minimising the amount of ifdefs.

I prefer to remove it entirely, to avoid situations like 64e where it=20
was being used without understanding what the value really was.

32e can come in a later cleanup to avoid making this series any bigger.

Thanks,
Nick
