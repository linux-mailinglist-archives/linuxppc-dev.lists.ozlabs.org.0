Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BA724A11
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:20:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbHL35kjCz3f8s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 03:20:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mentor.com (client-ip=68.232.141.98; helo=esa2.mentor.iphmx.com; envelope-from=joseph_myers@mentor.com; receiver=<UNKNOWN>)
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Wed, 07 Jun 2023 03:20:00 AEST
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbHKX6vrpz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 03:20:00 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="6.00,221,1681200000"; 
   d="scan'208";a="8982264"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 06 Jun 2023 09:18:52 -0800
IronPort-SDR: WaDFQSCeIUx5yP0ZEaCfRHB8w5dJotp+BMYNHVqwEj/E6mfGSoC9KKuyaAjTDjI8+gLMMb2Zgi
 83Fm9azaOuOD0G50wGE9H4uMAIIabl57hUAJsAzAB2v7Xms5LEoy8pchYSwIQWvRFK6mbIxSMB
 LloFVbOw053McNcNRPgM3lX7+impBX1jrmzPDe6zTm5/2FyQsFOZlyoC7ZOODU20YEDY+56EER
 csvyuFiLfnc7x4F27Ml3XU3b3ekVikl8bv3EFmU8eHFgH4SNFatsmAhWrMScqJsKYvlN3/p5DG
 mWc=
Date: Tue, 6 Jun 2023 17:18:47 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Andrew Pinski <pinskia@gmail.com>
Subject: Re: Passing the complex args in the GPR's
In-Reply-To: <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com>
Message-ID: <c3e887b3-7c98-22b9-75d8-39edd7631d3@codesourcery.com>
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com> <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Umesh Kalappa <umesh.kalappa0@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 6 Jun 2023, Andrew Pinski via Gcc wrote:

> You are looking at the wrong ABI document.
> That is for the 64bit ABI.
> The 32bit ABI document is located at:
> http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf
> 
> Plus the 32bit ABI document does not document Complex argument passing
> as it was written in 1995 and never updated.

For the 32-bit ABI see 
https://www.polyomino.org.uk/publications/2011/Power-Arch-32-bit-ABI-supp-1.0-Unified.pdf 
(sources at https://github.com/ryanarn/powerabi - power.org has long since 
disappeared).

-- 
Joseph S. Myers
joseph@codesourcery.com
