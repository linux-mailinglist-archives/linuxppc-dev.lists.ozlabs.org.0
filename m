Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F4371028
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 02:52:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYPZR3JXRz3035
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 10:52:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fOPxxZQB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fOPxxZQB; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYPZ11Bbqz2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 10:51:50 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id d29so1760376pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 17:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=izGt57y2YQAnZqBDnYVADfYd5K9xkYSv3S21aSrnD4w=;
 b=fOPxxZQBipF0z3Eyn4m5WXwe2xQhj08Sn76S2gbztajnWwa6TZQ690CEaumwtL8yUh
 4JdKLEVpOVIvNmD/pyK/orHwevhiOPlZki/5Ee4V6n3QFDmezn2oTlQFHvMnFWf3LNIv
 y93bh5AK8mSz7+BxTs3rUiN4yESIWqnOhHOmsm5OZWIyLVh0uhRJpbhudNF78mAVsVyp
 x1SKGd4Fbkw2f5CkHYs7TAG9Pe1sx968eNumJAQ81X/d7/WgifgbDchH8TT5DZul6A3u
 GiOORUE8JRc4lZRA7pYIQTcT0r30fsXU1mdgreZTo9nKBA/zdsnCf2tDPeI3zo7NT6tZ
 095w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=izGt57y2YQAnZqBDnYVADfYd5K9xkYSv3S21aSrnD4w=;
 b=ZK8KWtIv5LjRK8MDL/w9QT2Wyn3zVF0FtArj1IR8QdedHH1kDjhJnnEL9FZddt05Li
 7UGg/Re/CSzwZEXuVSFcRAP5oBMD4owrn1RrauJDiQlhikQtb0KBnA6PfBID6cH65GC+
 Zl+UqSRK7OUGcAJcSKS0QMh5Tpi2VpZ23cienwcRhnyBLJxVImBM3r9WTOkxk79KHdBI
 JER5K+NSH5JM8PfADlbFKhprjaXwB02Dp+Ef4uuh4JaBHM8D14efQ6Od/F9ovivWx27+
 JbJCMEDGPLtRv0s5CD4QDlM+wII4zvMgw46Yor7t8SmOnDvT5YnhKZC3Nkd3BlfIiMH8
 aX7A==
X-Gm-Message-State: AOAM533HWG6ZgdPPNDFb4UoMSIq8f7X8hn/l6IvUxjIUaVm+B+MCi6GN
 /ZhWa6vs8xde6p6DFATzVv5RGeMksOk=
X-Google-Smtp-Source: ABdhPJxqckR9LKnKwmkCy03nCcFOh0ExND84Fk8QUn7Zz9mPEgP75da99m9UismrpR2WfUqf7mfbRw==
X-Received: by 2002:a65:67d5:: with SMTP id b21mr15842330pgs.117.1620003106967; 
 Sun, 02 May 2021 17:51:46 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id ms2sm3887197pjb.8.2021.05.02.17.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 17:51:46 -0700 (PDT)
Date: Mon, 03 May 2021 10:51:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20200428234046.GP17645@gate.crashing.org>
 <1588121596.7zej1imag0.astroid@bobo.none>
 <20210502175506.GE10366@gate.crashing.org>
In-Reply-To: <20210502175506.GE10366@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1620002801.0iaahdk9xn.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of May 3, 2021 3:55 am:
> On Wed, Apr 29, 2020 at 10:57:16AM +1000, Nicholas Piggin wrote:
>> Excerpts from Segher Boessenkool's message of April 29, 2020 9:40 am:
>> I blame toolchain for -mabi=3Delfv2 ! And also some blame on ABI documen=
t=20
>> which is called ELF V2 ABI rather than ELF ABI V2 which would have been=20
>> unambiguous.
>=20
> At least ELFv2 ABI is correct.  "ELF ABI v2" is not.
>=20
>> I can go through and change all my stuff and config options to ELF_ABI_v=
2.
>=20
> Please don't.  It is wrong.

Then I'm not sure what the point of your previous mail was, what did I=20
miss?

> Both the original PowerPC ELF ABI and the
> ELFv2 one have versions themselves.  Also, the base ELF standard has a
> version, and is set up so there can be incompatible versions even!  Of
> course it still is version 1 to this day, but :-)

The point was for people who don't know ELFv2 has a specific meaning for=20
powerpc, then ELF ABIv2 is more explanatory about it being an abi change
rather than base elf change, even if it's not the "correct" name.

If you don't want that then good, I also prefer to just use ELFv2. I=20
think people who change this option can easily look up the name in=20
toolchain and other docs.

Thanks,
Nick
