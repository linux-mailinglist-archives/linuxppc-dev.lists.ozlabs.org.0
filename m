Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95DA2A6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 00:59:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KJ393RYqzDsGt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 08:59:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a67i6Nzu"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KJ1L2LJDzDrc4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 08:58:14 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t14so2294785plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 15:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=F8TbrY6RUN5nBSMtfDsehDraEkR2kiBnPcuZscRBZjo=;
 b=a67i6NzufFczZofVH34ffLJjfj9JJYUalEEgIUXtKsFMOGkNbLfmbQY0dsSybvMB6R
 0giCaDyBV91Q0MzM063vATaidoGJ0EnXYd6FuRTc/dNPlv3Xtr3D/tS6QkpKlB96BSEe
 k5N4qtErie/8gXXd1bw/zEUn0rQvIrSvIwthe5h22pkDVsJzGiWtl7G3HRmO09OOlIAJ
 p/9+Ql66iBM6XtlH2raO3PCrsgAgwn7wB730pmvg+eicBcbMvRp6qPQ672SC3/LE9n8+
 dyg5WYbm8vATS13ic2ufyeqCjjphqff3NrTAqNpGrxgWqRdQ1xhEUMZWIQ21qq0OCKh/
 w3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=F8TbrY6RUN5nBSMtfDsehDraEkR2kiBnPcuZscRBZjo=;
 b=WIKPwh9y7QxfYUag3OlWy+0hKrlNFGI/5ELWpnklTP+UrTZWZ5N8p3XOq4AfhTY4mn
 VYBmr0gcegLrCYQTyscTdtxh+/zcEyeyF3h5b2D0tCmSG1j7Qi1D7WU4p5i8QUsZlcm9
 nXSt/gFHDgh8UNlde+3iZi/Vu1CLTxhuhSXnuDC2cCrXhCEf/wrMhdqgAUU8vs6zl7Qg
 ATy7BnS92TGFQAjnVmNJuqMfV3NsZUEk9cgB/HrY9bL6WLdXSbIsaS+2n/CoNEPpKOlj
 1ZFVoCny4XIQyimgT3KK8oKMMokh7p78z35T31eb5YQ530QOm33sT+mBUxTLudE0axKl
 9Ojg==
X-Gm-Message-State: APjAAAUvJ2oOG1BHhFVuadNCQe6ljFQeMKjuEcZPsOzC84TVWRYjBUfe
 i68fho30SkoCBxRW4WeYHNA=
X-Google-Smtp-Source: APXvYqz68ihk34LhhjtgDA2TgO0OTRAdtPRnb5DNrydI6/Ojr15AQfjA2CMw2J1VosWCN5+3/so33g==
X-Received: by 2002:a17:902:7006:: with SMTP id
 y6mr8589031plk.320.1567119490720; 
 Thu, 29 Aug 2019 15:58:10 -0700 (PDT)
Received: from localhost (27-33-83-4.tpgi.com.au. [27.33.83.4])
 by smtp.gmail.com with ESMTPSA id t189sm4868229pfd.58.2019.08.29.15.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 15:58:09 -0700 (PDT)
Date: Fri, 30 Aug 2019 08:56:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc/64: syscalls in C
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20190827135548.21457-1-npiggin@gmail.com>
 <5ecd9d1a-d35e-dc8c-9ad4-a830a8b1a952@c-s.fr>
 <1566985278.ehbnos9t6c.astroid@bobo.none>
 <4d0359d8-0958-583f-7727-10a51bd3c7c6@c-s.fr>
 <1567070800.hlilai6sy6.astroid@bobo.none>
 <20190829115122.GJ31406@gate.crashing.org>
 <1567092470.5ojl8q11gz.astroid@bobo.none>
In-Reply-To: <1567092470.5ojl8q11gz.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567116332.7u11w9bm6k.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin's on August 30, 2019 1:49 am:
>> This doesn't do what you think, or what you want, or what you think you
>> want ;-)
>=20
> After reading gcc docs from gcc 4 to 9, I think it does.
>=20
> We want this to apply to all functions in the compilaition unit. It's
> fine to use the regs temporarily, and so it's fine for called functions
> in other units to call them (because they will be restored), and we
> don't want them restored for our caller.
>=20
>> (And if you make all those regs -ffixed-* you are in for a world of hurt=
).
>=20
> From the look of it, -ffixed would be a little bit stronger in that it
> will never allow the register to be used, wheras the global register
> variable allows it to be allocated and used elsewhere so long as its
> observable value is not affected. The latter is actually preferred=20
> because it's fine for the compiler to use the regs if it wants to. It
> does not even have to use r15 register when I reference r15 variable,
> only whatever value it had.

Ah, of course that means all of them need to be inputs to the stmw
asm (which makes sense and is documented in gcc-9 doc, which is when
the compiler was allowed to allocate them for other things.

Thanks,
Nick


=
