Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0050700F02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 20:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHyKv3tcPz3fXx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 04:42:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=UIhGNBCT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=UIhGNBCT;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHyK04tLLz3fNy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 04:41:23 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-530afadca55so100670a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683916880; x=1686508880;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/koMj+9kCWnn+HpYnU02beKNw32OHAll5JRoBttwWow=;
        b=UIhGNBCTmqrch9vZbwJdVHFCubylnX3lcJyBGWavwa7JY8D/CttT9kGCDbOafsAU5t
         vRGkZetPBOTBep0hAclU+TvrJrsGAcm/cmzfx87RHZxbSOm/1zOHCe1nI8Z1CWv1Ps9D
         D952EwlqaD3t3yacv+04O0gQbGqwleDPiwJAfoDvrdUT6jNeoX47UMmTa5Nhrxp9KLTu
         JlBCktj76+eSbrUIG9171EIYm1HesTFO1GehE0SGP7Zz4cud4wCc0eSKdVsUSQ1gmH6f
         qpkn9CtmJbzw5p3uYmUZ0UnZpWrgxx2rYRHTfZBYjywgnOZqECdRQJFMHKa48i7ms19Q
         y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683916880; x=1686508880;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/koMj+9kCWnn+HpYnU02beKNw32OHAll5JRoBttwWow=;
        b=gEIO8x+jga/aufps5qdBIzZF5drm+MSFzgvpk37E2S++jBXd3opYSy+FWbGjRCyLLx
         m/GH8c1aQ8qDgigLL9lmB+y+9d3GDf/78HzIVVpgx20tXsUsnlwdKUaqZ+rMROe+4ygj
         PG1iWSAgltRSxlUCeB4BL8x4syO455NUdMOCl4q3tF/XM9Y+ffV92pQoClWGjPEr89/z
         G+8yQk6gXneaG8SdSlhVmEL3RIgr+6Blqq5Vpf/K6OUdbvIvz1gL7T2wwiZspozjiP80
         OCfrfPCZpHvwtWnPnNi04wbg2KC3/P0j9yQVmW4Ranm0xghrcfwIkaQL9G95wz1JUNGY
         /fww==
X-Gm-Message-State: AC+VfDy+FX3Z6jKfiQhgtk9zks2AOsYYyzU6LihuiMMwMfLACisX56Ls
	7u5qGf5oHsmIHQvpGNXWZVXTTg==
X-Google-Smtp-Source: ACHHUZ7tzMVQBdyjPy08WAKw09bAKD7sofw01RBIRabRo3XqbykGfqUcjR5vOU1bPn+AEZQv0/dWSA==
X-Received: by 2002:a17:90a:ea90:b0:24d:ee3f:b682 with SMTP id h16-20020a17090aea9000b0024dee3fb682mr24863163pjz.35.1683916880378;
        Fri, 12 May 2023 11:41:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090a020300b00250c1392ed3sm6500634pjc.55.2023.05.12.11.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 11:41:19 -0700 (PDT)
Date: Fri, 12 May 2023 11:41:19 -0700 (PDT)
X-Google-Original-Date: Fri, 12 May 2023 11:40:58 PDT (-0700)
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <87ttwi91g0.fsf@igel.home>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-c528747d-5f47-4e42-b6db-f9db4e756ff9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 May 2023 11:18:23 PDT (-0700), schwab@linux-m68k.org wrote:
> On Mai 09 2023, Alexandre Ghiti wrote:
>
>> On 5/9/23 21:07, Andreas Schwab wrote:
>>> That does not work with UEFI booting:
>>>
>>> Loading Linux 6.4.0-rc1-1.g668187d-default ...
>>> Loading initial ramdisk ...
>>> Unhandled exception: Instruction access fault
>>> EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
>>> EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
>>> Unhandled exception: Load access fault
>>> EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
>>> EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted
>>>
>>> Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
>>> UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
>>> UEFI image [0x00000000daa82000:0x00000000dcc2afff]
>>>
>>
>> I need more details please, as I have a UEFI bootflow and it works great
>> (KASLR is based on a relocatable kernel and works fine in UEFI too).
>
> It also crashes without UEFI.  Disabling CONFIG_RELOCATABLE fixes that.
> This was tested on the HiFive Unmatched board.
> The kernel image I tested is available from
> <https://download.opensuse.org/repositories/Kernel:/HEAD/RISCV/>.  The
> same kernel with CONFIG_RELOCATABLE disabled is available from
> <https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/kernel/standard/>.

Sorry I missed this earlier, there's been some other reports of boot 
failures on rc1 showing up but those were all a lot more vague.  Just 
setting CONFIG_RELOCATABLE=y doesn't manifest a boot failure on QEMU on 
my end and I don't have an UNmatched floating around.

Alex says he's going to look into it (and IIRC he has my Unmatched...).
