Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5432688D36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 03:46:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Kmb3mkrz3f7h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 13:46:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JyiEUSKh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JyiEUSKh;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Klf32qQz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 13:45:49 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id q9so2764803pgq.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Feb 2023 18:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBOAUiNQ/mUK+ucDXemLW03th/5lppbNUK8agoo8boo=;
        b=JyiEUSKhK2pWfJDv+ivY/U0Gw9RN+qe+jLJEGLHGmYB0F4TVSFr34WEphWla+5SVTt
         ObDLjmFQolcccr24Lb7R0396tdLsGNMYzWMPlLCZ3s8Y6z5KNMtVYaQjamHEUO3mWS17
         sSPipPehFHdDIO8Q7cVBBYe7XG4G+jXOpxZo9qllMxyj8oRi335mg48TQx01bxdWZv8s
         GCaAQDAc8BhMAcFmaWKe/lPAo8AnTceBJVYfgLT83ocIyUVN0WMGP2DNPMhZ+dXrMTdQ
         e6mfDq/vKeaaAEUtv2+mFbd0DYKxMzNrr3nG9G12pD1zDcbNFtchd+YVwibAxSu+mUsb
         29kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fBOAUiNQ/mUK+ucDXemLW03th/5lppbNUK8agoo8boo=;
        b=aO+XsD61nrjnJoWEUICqTwEytHLyVWVJoBvoRImGlaw0QXEq16Hm2R/YfjT6zmDqnW
         HSk/xjDmWziTQMoo2rHUmnPt7AM+BTKfsXH7nUoB7jID2Y10y9zKElHxniPeFujGtoSO
         E9id3431Cg2OAL9HvxBBL169Up/bA8S/uJt5q2bVY9OakvOzsEZadjHpjPvjPPO0x4WQ
         Ei7bdCDdEOj98jmTcKKmiLa4orXr/SozNFsGqicjjrbjjXErTLULbrp0GNlF+bBfM4D4
         doPl/g0ZtSsD3xxZltObYvY97Ka/UhKbeDjpH0VZSDXEHTG3esIzWf2oxCAAdQe957LC
         RYxw==
X-Gm-Message-State: AO0yUKU3gN/UwUDXPdeQgruVMIQstFm63iLtlMi9bCCNm3SSMIhVn+aO
	FsJlogCPcVHGVkjd7TKbaxs=
X-Google-Smtp-Source: AK7set/fjHHMz8haI3xgiadUs+PTKhiUbyeLWt7ubhPZ18tHsy84Hu+X13hwYBPk/ZtOovBgK5TYAQ==
X-Received: by 2002:a05:6a00:882:b0:593:908c:240 with SMTP id q2-20020a056a00088200b00593908c0240mr11077976pfj.14.1675392346411;
        Thu, 02 Feb 2023 18:45:46 -0800 (PST)
Received: from localhost (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id m6-20020aa79006000000b00571f66721aesm425762pfo.42.2023.02.02.18.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:45:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Feb 2023 12:45:40 +1000
Message-Id: <CQ8L0O2CYDIX.8HICM7H2PCMN@bobo>
Subject: Re: Bug: Write fault blocked by KUAP! (kernel 6.2-rc6, Talos II)
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, "Erhard F."
 <erhard_f@mailbox.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20230203004649.1f59dbd4@yea>
 <5f0714428e4c696e3d5c00f3bafb4d2970cb6e2b.camel@linux.ibm.com>
In-Reply-To: <5f0714428e4c696e3d5c00f3bafb4d2970cb6e2b.camel@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 3, 2023 at 12:02 PM AEST, Benjamin Gray wrote:
> On Fri, 2023-02-03 at 00:46 +0100, Erhard F. wrote:
> > Happened during boot:
> >=20
> > [...]
> > Creating 6 MTD partitions on "flash@0":
> > 0x000000000000-0x000004000000 : "PNOR"
> > 0x000001b21000-0x000003921000 : "BOOTKERNEL"
> > 0x000003a44000-0x000003a68000 : "CAPP"
> > 0x000003a88000-0x000003a89000 : "VERSION"
> > 0x000003a89000-0x000003ac9000 : "IMA_CATALOG"
> > 0x000003e10000-0x000004000000 : "BOOTKERNFW"
> > BTRFS info: devid 1 device path /dev/root changed to /dev/nvme0n1p3
> > scanned by systemd-udevd (387)
> > Kernel attempted to write user page (aa55c280000) - exploit attempt?
> > (uid: 0)
> > ------------[ cut here ]------------
> > Bug: Write fault blocked by KUAP!

KUAP is a red herring of course, the KUAP test just checks if the
faulting address is below TASK_SIZE.

[snip]

> > --- interrupt: 300 at __patch_instruction+0x50/0x70
> > NIP:=C2=A0 c000000000064670 LR: c000000000064c2c CTR: c000000000048ee0
> > REGS: c000000023b57630 TRAP: 0300=C2=A0=C2=A0 Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 T=C2=A0=C2=A0
> > (6.2.0-rc6-P9)
> > MSR:=C2=A0 900000000280b032 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI>=C2=A0 CR:
> > 24222244=C2=A0 XER: 00000000
> > CFAR: c00000000006462c DAR: 00000aa55c280000 DSISR: 42000000 IRQMASK:
                                            ^^^^        ^^
First byte of page, store, no PTE.

> > 1=20
> > GPR00: 0000000000000000 c000000023b578d0 c000000000e7cc00
> > c00800000ce33ffc=20
> > GPR04: 041ae13000000000 00000aa55c27fffc 0000000000000000
                                        ^^^^
Last word of previous page.

Probably from create_stub function descriptor patching, which is not
actually patching in an instruction so it probably gets unlucky and
gets some data that matches prefix opcode and so it tries to store
8 bytes.

So not your bug, your temp mm code just exposed it. Data shouldn't
be patched using patch_instruction. We should have a patch_data_u32
or similar that doesn't use instructions.

Thanks,
Nick
