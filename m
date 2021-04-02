Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C7352A97
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 14:20:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBfJT2FD2z3c71
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 23:20:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.255.19; helo=2.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 2.mo51.mail-out.ovh.net (2.mo51.mail-out.ovh.net
 [178.33.255.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBfHn4TVqz3btG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 23:19:32 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 8060B2799CD;
 Fri,  2 Apr 2021 14:19:28 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 2 Apr 2021
 14:19:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002fac2e674-15cb-48a6-8ecc-be0871fa7712,
 CED0CE0CC895D647B8CFE0BE9502FE01F599FB05) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 8/9] powerpc/xive: Map one IPI interrupt per node
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Nicholas Piggin <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20210331144514.892250-1-clg@kaod.org>
 <20210331144514.892250-9-clg@kaod.org>
 <1617279896.hl1bn8g3eg.astroid@bobo.none>
 <ae512e1b-91ee-1cc8-c6a8-36e014ed8788@kaod.org>
Message-ID: <9f661b26-1633-8e7f-01c4-378dd208de0f@kaod.org>
Date: Fri, 2 Apr 2021 14:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ae512e1b-91ee-1cc8-c6a8-36e014ed8788@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1116371b-63d2-4714-9829-6665c9a317ef
X-Ovh-Tracer-Id: 851180333645532128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiiedghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffhvfhfkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieevheegvdefjefgvdduveekgfejvedtheeuieffudeiueduueffgfetteekkeegnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> I gave the patch below a try and we are reaching the same results, 
> even better. The simplest solution is always the best. Nick, you 
> should send that single patch.

FYI, here are results in a KVM guests with pinned vCPUs.

 * P9 DD2.2 - 2s * 64 threads - KVM guest :


                            IPI/sys                           IPI/chip
 -----------   --------------------------------   --------------------------------
                           unhandled                          unhandled               	
 chips  cpus   noirqdebug  detection              noirqdebug  detection 	    
 -----------   --------------------------------   --------------------------------
 1      0-15     4.152813   4.084240   4.061028     4.097700   4.042539   4.008314
        0-31     8.186328   8.157970   7.937127     8.277942   8.019539   7.831189
        0-47    11.391635  11.232960  11.017530    11.278048  10.994501  10.889347
        0-63    13.907476  14.022307  11.460280    13.933946  13.506828  11.369188
 2      0-79    18.105276  18.084463   8.376047    18.069176  17.587916  15.477006
        0-95    22.100683  22.265763   7.338229    22.084006  21.588463  19.502192
        0-111   25.305948  25.473068   6.716235    25.429261  24.607570  22.733253
        0-127   27.814449  28.029029   6.222736    27.960119  27.253432  23.884916

                              

The three columns "IPI/chip" are results with this series. "IPI/sys" are 
without. The "unhandled detection" columns are with Nick's patch.

C. 


