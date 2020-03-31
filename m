Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9673199991
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:25:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sCp45BdZzDqN8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 02:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ascii.art.br (client-ip=23.83.212.18;
 helo=bisque.elm.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ascii.art.br
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha1
 header.s=ascii.art.br header.b=hiaO4KX3; 
 dkim-atps=neutral
X-Greylist: delayed 446 seconds by postgrey-1.36 at bilbo;
 Wed, 01 Apr 2020 02:20:31 AEDT
Received: from bisque.elm.relay.mailchannels.net
 (bisque.elm.relay.mailchannels.net [23.83.212.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sCgz3yfvzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 02:20:30 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id F09801015A5;
 Tue, 31 Mar 2020 15:12:59 +0000 (UTC)
Received: from pdx1-sub0-mail-a17.g.dreamhost.com
 (100-96-12-20.trex.outbound.svc.cluster.local [100.96.12.20])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 4AC1710148F;
 Tue, 31 Mar 2020 15:12:59 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from pdx1-sub0-mail-a17.g.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.6); Tue, 31 Mar 2020 15:12:59 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|tuliom@ascii.art.br
X-MailChannels-Auth-Id: dreamhost
X-Stretch-Zesty: 258cb88452f088f6_1585667579802_3290099734
X-MC-Loop-Signature: 1585667579802:1440160003
X-MC-Ingress-Time: 1585667579802
Received: from pdx1-sub0-mail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a17.g.dreamhost.com (Postfix) with ESMTP id 053A39382C;
 Tue, 31 Mar 2020 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=ascii.art.br; h=from:to:cc
 :cc:subject:in-reply-to:references:date:message-id:mime-version
 :content-type; s=ascii.art.br; bh=1D0HBWvk6wYEuADNrsK1rZaHaWw=; b=
 hiaO4KX3ObeSNczLNumPj9Q3kNXsv1J/JD2EWo490mwGtEKC48+fziyZFJy4Feoq
 cXtxyIFbYpMlu7JQV65OOD1ljjUHGOM29ZS+zYKyCieuqt1ZCnBEKGYzmlkHoftX
 Luct4BDGIh6fVGOtI/ZY6IuWlniAhbiqie4FzwRWCkM=
Received: from ascii.art.br (ip-191-5-81-82.isp.valenet.com.br [191.5.81.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: tuliom@ascii.art.br)
 by pdx1-sub0-mail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 884E57F7F2;
 Tue, 31 Mar 2020 08:12:55 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a17
From: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Add new HWCAP bits
In-Reply-To: <20200331094247.28976-1-alistair@popple.id.au>
References: <20200331094247.28976-1-alistair@popple.id.au>
User-Agent: Notmuch/0.29.1 (http://notmuchmail.org) Emacs/26.3
 (x86_64-redhat-linux-gnu)
Date: Tue, 31 Mar 2020 12:12:51 -0300
Message-ID: <877dz0sglo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -100
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtddtgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffujghffgffkfggtgesthdtredttdertdenucfhrhhomhepvfhulhhiohcuofgrghhnohcusfhuihhtvghsucforggthhgrughoucfhihhlhhhouceothhulhhiohhmsegrshgtihhirdgrrhhtrdgsrheqnecukfhppeduledurdehrdekuddrkedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheprghstghiihdrrghrthdrsghrpdhinhgvthepudeluddrhedrkedurdekvddprhgvthhurhhnqdhprghthhepvfhulhhiohcuofgrghhnohcusfhuihhtvghsucforggthhgrughoucfhihhlhhhouceothhulhhiohhmsegrshgtihhirdgrrhhtrdgsrheqpdhmrghilhhfrhhomhepthhulhhiohhmsegrshgtihhirdgrrhhtrdgsrhdpnhhrtghpthhtoheprghlihhsthgrihhrsehpohhpphhlvgdrihgurdgruh
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
Cc: , Alistair Popple <alistair@popple.id.au>, mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple <alistair@popple.id.au> writes:

> diff --git a/arch/powerpc/include/uapi/asm/cputable.h b/arch/powerpc/include/uapi/asm/cputable.h
> index 540592034740..8888c6fe10b2 100644
> --- a/arch/powerpc/include/uapi/asm/cputable.h
> +++ b/arch/powerpc/include/uapi/asm/cputable.h
> @@ -50,6 +50,8 @@
>  #define PPC_FEATURE2_DARN		0x00200000 /* darn random number insn */
>  #define PPC_FEATURE2_SCV		0x00100000 /* scv syscall */
>  #define PPC_FEATURE2_HTM_NO_SUSPEND	0x00080000 /* TM w/out suspended state */
> +#define PPC_FEATURE2_ARCH_3_10		0x00040000 /* ISA 3.10 */

I think this should have been:

#define PPC_FEATURE2_ARCH_3_1		0x00040000 /* ISA 3.1 */

-- 
Tulio Magno
