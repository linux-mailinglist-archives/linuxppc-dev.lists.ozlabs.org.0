Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B163D9FF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 10:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb4FC3VjYz3cX5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 18:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
X-Greylist: delayed 535 seconds by postgrey-1.36 at boromir;
 Thu, 29 Jul 2021 18:58:04 AEST
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb4Dr751lz303f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 18:58:04 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Gb42D4j8Tz1sCwX;
 Thu, 29 Jul 2021 10:48:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Gb42D32p0z1qtd0;
 Thu, 29 Jul 2021 10:48:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id oMvEDgj56lUa; Thu, 29 Jul 2021 10:48:51 +0200 (CEST)
X-Auth-Info: k+VKLP388ffXDZznYLKlVDEJtANVdcRW8eipMVkyAUOuTqqtkyriWgBfwNP07t2I
Received: from igel.home (ppp-46-244-182-186.dynamic.mnet-online.de
 [46.244.182.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 29 Jul 2021 10:48:51 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 8238C2C2611; Thu, 29 Jul 2021 10:48:50 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Possible regression by ab037dd87a2f (powerpc/vdso: Switch VDSO
 to generic C implementation.)
References: <a273c619-9258-e29a-24c3-ea47a13c4817@molgen.mpg.de>
 <3661999754da1a5e5c810fa669654cc7db95b059.camel@kernel.crashing.org>
 <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
 <878s1q1udj.fsf@mpe.ellerman.id.au>
 <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>
 <875ywt1s9r.fsf__45665.8238823124$1627544516$gmane$org@mpe.ellerman.id.au>
X-Yow: Who wants some OYSTERS with SEN-SEN an' COOL WHIP?
Date: Thu, 29 Jul 2021 10:48:50 +0200
In-Reply-To: <875ywt1s9r.fsf__45665.8238823124$1627544516$gmane$org@mpe.ellerman.id.au>
 (Michael Ellerman's message of "Thu, 29 Jul 2021 17:41:20 +1000")
Message-ID: <87fsvx4ia5.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Derek Parker <parkerderek86@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 laboger@linux.vnet.ibm.com, Dmitrii Okunev <xaionaro@gmail.com>, murp@ibm.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jul 29 2021, Michael Ellerman wrote:

> I haven't been able to reproduce the crash by following the instructions
> in your bug report, I have go1.13.8, I guess the crash is only in newer
> versions?

Yes, only go1.14 and later are affected.

https://build.opensuse.org/package/live_build_log/openSUSE:Factory:PowerPC/go1.13/standard/ppc64
https://build.opensuse.org/package/live_build_log/openSUSE:Factory:PowerPC/go1.14/standard/ppc64

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
