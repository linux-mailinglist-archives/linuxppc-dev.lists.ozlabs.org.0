Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C7EA37F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 19:40:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473HM034JBzF4l8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 05:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="mTyhb2WX"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473HJQ5nq4zF4Yd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 05:37:58 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id y39so4670479qty.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHnIQMBr1d2PBkFKg9+48UHbMPOf8AnDHCpyaYzr6yI=;
 b=mTyhb2WXi4RPa3P3+5+NZmahn0lBQDLsP1egaAn1E9E7Wg24YnLRwlrzaa0oKx4JMY
 45HngzAgZQdNoj+UEBq8ASZiO4AxW1LGE81F7pwbyPgxyUIHMLgi3xSMbBu6S/CL/bRZ
 jETKLL7N8n0bvGzxrVVtkxbwqT4TXG0friqMBAZj2/H+LQCOyebJuZbW0qUVCym3Zx2Y
 NE/4M0sZYIF+lO98gVm/9JDSOORwGXzxfQKP0Ol9UTzI37OtaD+6ljnPePJ5I04CBXNa
 2pNVGnt+MdGMMVHfS7zxFfG03yPoPofycxmTqh46Q8fWOjOdBPVH1TX2nxzVWR1yH6K2
 viTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHnIQMBr1d2PBkFKg9+48UHbMPOf8AnDHCpyaYzr6yI=;
 b=P1RyZL5g8OV+7W6WanByppMObhUEL3p74EC6SpF5P9hAPaCKlT55aovwSUu27qaHQt
 eDstBr99pBhI7TRUyOnpDVlYCRME4U+hVnN+4hj7GRWpVPS5pbOumDRhygRFccWuljA0
 QLzc1h4paeIk1e5k460oSu4pke9zhFJ9SWLYeVjYrzwkjRMtGHMQD0feclDDbNhg4hV5
 IwgVVhiwn6lyAsNu1dMdJ5yqF+BHZFMCWurfR2wccF5owQAur0TJImsGqbeKrQ4gJaqf
 I2AN8FCIJd/ib4ZDGfhfk/0aQORKn238zxGF9PxNMlCizQWwfJINLpxL02RI87lrxpKE
 opow==
X-Gm-Message-State: APjAAAV5sul1zV5GTxSx6RQN0et8kWRJEqhVjXfJUp2U1Jq54lB5KApG
 kB7xXAIDjPf1D75ofTQO7HFxZQ==
X-Google-Smtp-Source: APXvYqw+hpvgBwnK6GJPA5nWZr6L9LCkJVs260uO94BfNmG4/Vgw64FIDYFO2kGtDWJNuhFJ9KcLXw==
X-Received: by 2002:ac8:c86:: with SMTP id n6mr1629040qti.80.1572460674389;
 Wed, 30 Oct 2019 11:37:54 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id p7sm483941qkc.21.2019.10.30.11.37.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 11:37:46 -0700 (PDT)
Message-ID: <1572460661.5937.104.camel@lca.pw>
Subject: Re: [PATCH v2] powerpc/imc: Dont create debugfs files for cpu-less
 nodes
From: Qian Cai <cai@lca.pw>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Date: Wed, 30 Oct 2019 14:37:41 -0400
In-Reply-To: <b1d6a06f-5f3b-d887-27cf-ba8c0255c4b0@linux.vnet.ibm.com>
References: <20190702092112.4015-1-maddy@linux.vnet.ibm.com>
 <87d0ihgojp.fsf@concordia.ellerman.id.au> <1563216075.4610.3.camel@lca.pw>
 <b1d6a06f-5f3b-d887-27cf-ba8c0255c4b0@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-23 at 16:57 +0530, Anju T Sudhakar wrote:
> Hi Qian,
> 
> On 7/16/19 12:11 AM, Qian Cai wrote:
> > On Thu, 2019-07-11 at 14:53 +1000, Michael Ellerman wrote:
> > > Hi Maddy,
> > > 
> > > Madhavan Srinivasan <maddy@linux.vnet.ibm.com> writes:
> > > > diff --git a/arch/powerpc/platforms/powernv/opal-imc.c
> > > > b/arch/powerpc/platforms/powernv/opal-imc.c
> > > > index 186109bdd41b..e04b20625cb9 100644
> > > > --- a/arch/powerpc/platforms/powernv/opal-imc.c
> > > > +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> > > > @@ -69,20 +69,20 @@ static void export_imc_mode_and_cmd(struct device_node
> > > > *node,
> > > >   	if (of_property_read_u32(node, "cb_offset", &cb_offset))
> > > >   		cb_offset = IMC_CNTL_BLK_OFFSET;
> > > >   
> > > > -	for_each_node(nid) {
> > > > -		loc = (u64)(pmu_ptr->mem_info[chip].vbase) + cb_offset;
> > > > +	while (ptr->vbase != NULL) {
> > > 
> > > This means you'll bail out as soon as you find a node with no vbase, but
> > > it's possible we could have a CPU-less node intermingled with other
> > > nodes.
> > > 
> > > So I think you want to keep the for loop, but continue if you see a NULL
> > > vbase?
> > 
> > Not sure if this will also takes care of some of those messages during the boot
> > on today's linux-next even without this patch.
> > 
> > 
> > [   18.077780][    T1] debugfs: Directory 'imc' with parent 'powerpc' already
> > present!
> > 
> > 
> 
> This is introduced by a recent commit: c33d442328f55 (debugfs: make 
> error message a bit more verbose).
> 
> So basically, the debugfs imc_* file is created per node, and is created 
> by the first nest unit which is
> 
> being registered. For the subsequent nest units, debugfs_create_dir() 
> will just return since the imc_* file already
> 
> exist.
> 
> The commit "c33d442328f55 (debugfs: make error message a bit more 
> verbose)", prints
> 
> a message if the debugfs file already exists in debugfs_create_dir(). 
> That is why we are encountering these
> 
> messages now.
> 
> 
> This patch (i.e, powerpc/imc: Dont create debugfs files for cpu-less 
> nodes) will address the initial issue, i.e
> 
> "numa crash while reading imc_* debugfs files for cpu less nodes", and 
> will not address these debugfs messages.
> 
> 
> But yeah this is a good catch. We can have some checks to avoid these 
> debugfs messages.

Anju, do you still plan to fix those "Directory 'imc' with parent 'powerpc'
already present!" warnings as they are still there in the latest linux-next?

> 
> 
> Hi Michael,
> 
> Do we need to have a separate patch to address these debugfs messages, 
> or can we address the same
> 
> in the next version of this patch itself?
> 
> 
> Thanks,
> 
> Anju
> 
> 
> 
> 
