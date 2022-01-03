Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C24A1482EB3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jan 2022 08:18:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JS6YR5YrDz3bqS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jan 2022 18:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1209 seconds by postgrey-1.36 at boromir;
 Mon, 03 Jan 2022 18:18:28 AEDT
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JS6Y05ZHQz2xBT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jan 2022 18:18:27 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3640B207C9;
 Mon,  3 Jan 2022 06:41:15 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 07:41:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010519d886-6aaf-4337-bfe0-c5278666afd4,
 2FB4A63B976BE1634B5E5BEF676EDDCED9FE10A5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4d03fc5f-8c0a-96d0-da83-17d7a019ab58@kaod.org>
Date: Mon, 3 Jan 2022 07:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/xive: Add missing null check after calling kmalloc
Content-Language: en-US
To: Ammar Faizi <ammarfaizi2@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20211226135314.251221-1-ammar.faizi@intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211226135314.251221-1-ammar.faizi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2e5ada26-2a7c-476c-84a3-c0e1a5e66fc8
X-Ovh-Tracer-Id: 11135994504318192489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopeihrghnghdrlhgvvgeslhhinhhugidrrghlihgsrggsrgdrtghomh
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/26/21 14:54, Ammar Faizi wrote:
> Commit 930914b7d528fc ("powerpc/xive: Add a debugfs file to dump
> internal XIVE state") forgot to add a null check.
> 
> Add it.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Fixes: 930914b7d528fc6b0249bffc00564100bcf6ef75 ("powerpc/xive: Add a debugfs file to dump internal XIVE state")
> Signed-off-by: Ammar Faizi <ammarfaizi2@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
