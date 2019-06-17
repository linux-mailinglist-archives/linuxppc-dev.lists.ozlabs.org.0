Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7147FD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 12:36:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S71f35gFzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 20:36:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.56.136; helo=1.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo6.mail-out.ovh.net (1.mo6.mail-out.ovh.net [46.105.56.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S6yw3NpSzDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 20:34:27 +1000 (AEST)
Received: from player168.ha.ovh.net (unknown [10.109.143.223])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id F3D8A1CF8AF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 11:06:40 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id A99566CFA4E2;
 Mon, 17 Jun 2019 09:06:34 +0000 (UTC)
Subject: Re: [PATCH 0/2] Fix handling of h_set_dawr
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190617071619.19360-1-sjitindarsingh@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <87e219c8-1db7-9976-03ce-5a566a8df7ab@kaod.org>
Date: Mon, 17 Jun 2019 11:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617071619.19360-1-sjitindarsingh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6350075477084113851
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: mikey@neuling.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/06/2019 09:16, Suraj Jitindar Singh wrote:
> Series contains 2 patches to fix the host in kernel handling of the hcall
> h_set_dawr.
> 
> First patch from Michael Neuling is just a resend added here for clarity.
> 
> Michael Neuling (1):
>   KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()
> 
> Suraj Jitindar Singh (1):
>   KVM: PPC: Book3S HV: Only write DAWR[X] when handling h_set_dawr in
>     real mode



Reviewed-by: Cédric Le Goater <clg@kaod.org>

and 

Tested-by: Cédric Le Goater <clg@kaod.org>


but I see slowdowns in nested as if the IPIs were not delivered. Have we
touch this part in 5.2 ? 

Thanks,

C.

