Return-Path: <linuxppc-dev+bounces-4790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D790A04C8E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 23:43:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSR0D532Kz305Y;
	Wed,  8 Jan 2025 09:43:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736289788;
	cv=none; b=ar1kOWvY0gWpOb5/8VL2GUfJ9MATdD8JsL6M6v6Uik4ZmctsBkx9gUrmhjDdwZIPbY7VxdJTg80WUnnlgPtN+3Q7xTNYFCk7YKdcysH0ZeWdBL7+kWDqtFFMalgB4fbq6FKTDu3FtilqUBwWqJkErKaDdCiwW0OlylOYDzsDQQ9N48wjqKbVnGIPBJ1pNvM0NsuA4ofoTh0UDhTg6/FbdcBeKLvSFGucoBBl8TwV9YZFyM79p206lbkmyjotDndtwyHZ0YJb6UokegZsG0SWjOhNqJW2oYEgzwDto5NsuDA/quQ963RRydo0rXkE8JgTQyd5NX3izfJbVqlSZWSHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736289788; c=relaxed/relaxed;
	bh=RTsDxbyrO38CBtnrx7tweqDOP5VEWORZ2f515i1af/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGfuer3eOKXqxfzWSmbTiXiIjVTXc91NNojvilL3C1sjonKemUKBqOfUcmogAmiMm1PKjQ8DeT+DU+i+XuPkQIjA5HOkq1xmyIBiu50x5QpBlDuCKTklEiDsTdBz2shvSvB7t0pTgLTGmrOAHBMlKV0x4wlnWKiMp+8vBIfvB/Q980gRPc8lYAz4CD2amw9ZyKOIKtxYLUZg7N4k00171w1CF9GJcGP2L5qnsoqwYAPz1mk3dyMejRBkvUOMJ6JI9uIDTbVfocll1T+hqVYHVvrvpi2W0unhoL3wWUuhafq6Q7Fk/TV8i8dmF7hM/Xko8oLbbV3pyVNEyilzONsNEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RoApPc1H; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RoApPc1H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSR093w9rz304f
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 09:43:04 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2164b1f05caso233377535ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736289781; x=1736894581; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTsDxbyrO38CBtnrx7tweqDOP5VEWORZ2f515i1af/s=;
        b=RoApPc1HVlxStYT+nh197Xo+1nmXwxq1vH9U6qae+eMqRNdZx97cs1s90UrlQx2Lb2
         Zl/ljFKUumk2t+BfD28937vDy0jUeOEGUi35eEl8gkQlh2h7D1a0Ft9tDEoQRdh42nrU
         NvC/V4aNdT8UuIhRitnEH5swa1LSjeeysgYfd+bP7/Xxv8QPMZzb7zFiCUqLTTSfUK2I
         5XzzUoLdlvE+OvrgFSJcegUHGaFusvL3BMpZBoXw4C9ksW4Mdj/ifnRp1iqfec9qPSKY
         wc/tiepmuzAzUoL8HCJx9Gt4dIGxtuvhpDcA/o3+AdB2dTdMQLge/LyMLW+AjJEr1SWO
         bO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736289781; x=1736894581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTsDxbyrO38CBtnrx7tweqDOP5VEWORZ2f515i1af/s=;
        b=ldmAOADTILP46Et8ZfzENkyX5l9tlAsrVGu1HNqVrOGnH+IhGYi/LjYFzGboagLNXx
         FA/9YqV0Ez3uN9jaFb8lV7lurizVCROWeInh8T9gXT1uah4QqjrXoGK5IfcsNGP6iPiJ
         DCiyxcKfEa0chzP3O3B+mjNloX+Qkm2AQ7RL+SSbE6rHVvfGnCnJohGxwiuNDmzrpzTH
         eJ7ZWACJoALEA9WQiRh9KLWUT0/kAZr0Ki6IXRWGtP/usDbHHa5KGECZaxG26VUYS88J
         sgLn5dv+FMdY7At0jBQgfG4+xfMWyKyoMvMYQbC0Qgb8ocB9eER0HR9zAGOXqtntGsaS
         FrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDUDPLXRI1qvkyYCFI0h2cEMBEcK4t5hPDfcM2pYPmubzqplmmn5ON5HN3ZoiZOWpuLnIVHbZ0vncsQUE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3w1mlyIMqv/myHr2kuPWgxSX6KbHiM1PhbMcFVzcMLmwogNIY
	kjsTj3MNsnBfTM8i+igIBb/hUy2fggxdOJ5b58V3W1h4MjLLL9uC
X-Gm-Gg: ASbGncumOv8zBf5qI4K80fQjAV/yxfxT3bTLSEP5Jda9yIwr2lhBqRz9vVbQxJoZE2A
	DZxuIG+71qMFzpBf2yk0haWqJ+YTLjay18dneLvEze5r1UMGQ1jCkPE9e5QL97fCqWSbwTsKG/F
	OUIhugOsXyK1p8hHsBHa8j7OaHPdI50gSqZChdK4m278wPGPzw49urr77fmGNRfUNPTYsWJc4PJ
	mPdiYCdmbiHDiPIyZeYWevkpL8RTp1EjS4GUqMe61gPsbmz46gwuqja
X-Google-Smtp-Source: AGHT+IGMNrHmKwHtJMQIeetE11mIavkI1sE71c5XVHpznlNl8Dj/rgoyz/Ujkb+Fu75xPqH/4BOviA==
X-Received: by 2002:a05:6a00:928c:b0:727:3935:dc83 with SMTP id d2e1a72fcca58-72d21fb1e07mr890974b3a.10.1736289781449;
        Tue, 07 Jan 2025 14:43:01 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbebsm33903786b3a.114.2025.01.07.14.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:43:00 -0800 (PST)
Date: Tue, 7 Jan 2025 14:42:59 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Nick Child <nnac123@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 03/14] ibmvnic: simplify ibmvnic_set_queue_affinity()
Message-ID: <Z32t88W3biaZa7fH@yury-ThinkPad>
References: <20241228184949.31582-1-yury.norov@gmail.com>
 <20241228184949.31582-4-yury.norov@gmail.com>
 <Z32sncx9K4iFLsJN@li-4c4c4544-0047-5210-804b-b8c04f323634.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z32sncx9K4iFLsJN@li-4c4c4544-0047-5210-804b-b8c04f323634.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 07, 2025 at 04:37:17PM -0600, Nick Child wrote:
> On Sat, Dec 28, 2024 at 10:49:35AM -0800, Yury Norov wrote:
> > A loop based on cpumask_next_wrap() opencodes the dedicated macro
> > for_each_online_cpu_wrap(). Using the macro allows to avoid setting
> > bits affinity mask more than once when stride >= num_online_cpus.
> > 
> > This also helps to drop cpumask handling code in the caller function.
> > 
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  drivers/net/ethernet/ibm/ibmvnic.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> > index e95ae0d39948..4cfd90fb206b 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -234,11 +234,16 @@ static int ibmvnic_set_queue_affinity(struct ibmvnic_sub_crq_queue *queue,
> >  		(*stragglers)--;
> >  	}
> >  	/* atomic write is safer than writing bit by bit directly */
> > -	for (i = 0; i < stride; i++) {
> > -		cpumask_set_cpu(*cpu, mask);
> > -		*cpu = cpumask_next_wrap(*cpu, cpu_online_mask,
> > -					 nr_cpu_ids, false);
> > +	for_each_online_cpu_wrap(i, *cpu) {
> > +		if (!stride--)
> > +			break;
> > +		cpumask_set_cpu(i, mask);
> >  	}
> > +
> > +	/* For the next queue we start from the first unused CPU in this queue */
> > +	if (i < nr_cpu_ids)
> > +		*cpu = i + 1;
> > +
> This should read '*cpu = i'. Since the loop breaks after incrementing i.
> Thanks!

cpumask_next_wrap() makes '+ 1' for you. The for_each_cpu_wrap() starts
exactly where you point. So, this '+1' needs to be explicit now.

Does that make sense?

> 
> >  	/* set queue affinity mask */
> >  	cpumask_copy(queue->affinity_mask, mask);
> >  	rc = irq_set_affinity_and_hint(queue->irq, queue->affinity_mask);
> > @@ -256,7 +261,7 @@ static void ibmvnic_set_affinity(struct ibmvnic_adapter *adapter)
> >  	int num_rxqs = adapter->num_active_rx_scrqs, i_rxqs = 0;
> >  	int num_txqs = adapter->num_active_tx_scrqs, i_txqs = 0;
> >  	int total_queues, stride, stragglers, i;
> > -	unsigned int num_cpu, cpu;
> > +	unsigned int num_cpu, cpu = 0;
> >  	bool is_rx_queue;
> >  	int rc = 0;
> >  
> > @@ -274,8 +279,6 @@ static void ibmvnic_set_affinity(struct ibmvnic_adapter *adapter)
> >  	stride = max_t(int, num_cpu / total_queues, 1);
> >  	/* number of leftover cpu's */
> >  	stragglers = num_cpu >= total_queues ? num_cpu % total_queues : 0;
> > -	/* next available cpu to assign irq to */
> > -	cpu = cpumask_next(-1, cpu_online_mask);
> >  
> >  	for (i = 0; i < total_queues; i++) {
> >  		is_rx_queue = false;
> > -- 
> > 2.43.0
> > 

