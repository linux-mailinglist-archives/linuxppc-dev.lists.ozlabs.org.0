Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FCE18DB90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 00:12:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kfgH1mQKzF0Vv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 10:12:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwn.net
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kfdb3f91zDrq6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 10:10:42 +1100 (AEDT)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 5F6412D6;
 Fri, 20 Mar 2020 23:10:38 +0000 (UTC)
Date: Fri, 20 Mar 2020 17:10:20 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 0/2] Don't generate thousands of new warnings when
 building docs
Message-ID: <20200320171020.78f045c5@lwn.net>
In-Reply-To: <cover.1584716446.git.mchehab+huawei@kernel.org>
References: <cover.1584716446.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 target-devel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 linux-scsi@vger.kernel.org, x86@kernel.org, Tyler Hicks <code@tyhicks.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Luca Ceresoli <luca@lucaceresoli.net>,
 Johannes Berg <johannes.berg@intel.com>, ecryptfs@vger.kernel.org,
 Matthias Maennich <maennich@google.com>, dmaengine@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Harry Wei <harryxiyou@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Mar 2020 16:11:01 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This small series address a regression caused by a new patch at
> docs-next (and at linux-next).

I don't know how I missed that mess, sorry.  I plead distracting times or
something like that.  Heck, I think I'll blame everything on the plague
for at least the next few weeks.

Anyway, I've applied this, thanks for cleaning it up.

jon
