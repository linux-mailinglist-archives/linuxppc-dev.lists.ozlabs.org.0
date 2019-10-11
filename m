Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C04D3767
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 04:09:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qBGW0ryJzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 13:09:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zytor.com
 (client-ip=198.137.202.136; helo=terminus.zytor.com;
 envelope-from=hpa@zytor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=zytor.com header.i=@zytor.com header.b="oW9dfaaR"; 
 dkim-atps=neutral
X-Greylist: delayed 1710 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Oct 2019 13:07:36 AEDT
Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qBDS66sXzDqTR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 13:07:36 +1100 (AEDT)
Received: from [IPv6:2601:646:8600:3281:14ec:615e:cb9c:4171]
 ([IPv6:2601:646:8600:3281:14ec:615e:cb9c:4171])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id x9B1cDnV301404
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 10 Oct 2019 18:38:14 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com x9B1cDnV301404
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2019091901; t=1570757896;
 bh=TUIhoFcV+31eZTr1kONofaEMms3/RhBG/iU3TdNS+pY=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=oW9dfaaRmKd2dWoG3cgkzVO7BvegyKalCQTxvCkvgSHMMP1aHzoAgAKgrdfUT1oLy
 knMJjvPLF83nLOn/ZAN3CPvsjjRfkJ0aerhHPcT19nudWK5NOitM033cLOnaGvI2e1
 LSFP3+8NCXofkKyTku2Ig+hd5GPCzdOhgJdURHIZGaQ2FvCQboeNg++CFWqgbXefQR
 /SpG4FYMCfGdB5IJbLA+2mNkqs5PSktOsAiaYQAYgeDgNBG+PkAvJWstHjn+LuCQM9
 xfo1Giy+1NXKFUnN4iD3tpGhUd+JWd6VRGxDGhkAiURF0SGwTc0cH1h/qmMomAnUUS
 wkKqLjoRiDOug==
Date: Thu, 10 Oct 2019 18:38:03 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <201910101657.234CB71E53@keescook>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20191010180331.GI7658@zn.tnic> <201910101657.234CB71E53@keescook>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/29] vmlinux.lds.h: Refactor EXCEPTION_TABLE and NOTES
To: Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>
From: hpa@zytor.com
Message-ID: <A020A6D1-C7DB-480B-826E-AE18308CD3E5@zytor.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On October 10, 2019 4:57:36 PM PDT, Kees Cook <keescook@chromium=2Eorg> wro=
te:
>On Thu, Oct 10, 2019 at 08:03:31PM +0200, Borislav Petkov wrote:
>> On Thu, Sep 26, 2019 at 10:55:33AM -0700, Kees Cook wrote:
>> > This series works to move the linker sections for NOTES and
>> > EXCEPTION_TABLE into the RO_DATA area, where they belong on most
>> > (all?) architectures=2E The problem being addressed was the discovery
>> > by Rick Edgecombe that the exception table was accidentally marked
>> > executable while he was developing his execute-only-memory series=2E
>When
>> > permissions were flipped from readable-and-executable to
>only-executable,
>> > the exception table became unreadable, causing things to explode
>rather
>> > badly=2E :)
>> >=20
>> > Roughly speaking, the steps are:
>> >=20
>> > - regularize the linker names for PT_NOTE and PT_LOAD program
>headers
>> >   (to "note" and "text" respectively)
>> > - regularize restoration of linker section to program header
>assignment
>> >   (when PT_NOTE exists)
>> > - move NOTES into RO_DATA
>> > - finish macro naming conversions for RO_DATA and RW_DATA
>> > - move EXCEPTION_TABLE into RO_DATA on architectures where this is
>clear
>> > - clean up some x86-specific reporting of kernel memory resources
>> > - switch x86 linker fill byte from x90 (NOP) to 0xcc (INT3), just
>because
>> >   I finally realized what that trailing ": 0x9090" meant -- and we
>should
>> >   trap, not slide, if execution lands in section padding
>>=20
>> Yap, nice patchset overall=2E
>
>Thanks!
>
>> > Since these changes are treewide, I'd love to get
>architecture-maintainer
>> > Acks and either have this live in x86 -tip or in my own tree,
>however
>> > people think it should go=2E
>>=20
>> Sure, I don't mind taking v2 through tip once I get ACKs from the
>> respective arch maintainers=2E
>
>Okay, excellent=2E I've only had acks from arm64, but I'll call it out
>again in v2=2E Thanks for the review!

I would like to once again advocate for the generalized link table mechani=
sm=2E It is nuts that each individual table should need vmlinux=2Elds hacki=
ng across architectures=2E
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
