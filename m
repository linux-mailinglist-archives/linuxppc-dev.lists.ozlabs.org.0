Return-Path: <linuxppc-dev+bounces-4793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA3A04D1C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 00:04:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSRTC498xz2yLr;
	Wed,  8 Jan 2025 10:04:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736291087;
	cv=none; b=bBjVgMJLJZUwMsrr0R8b7BgpCL6bt8ne7eo0fuLTx+pnztauGN/+TY6/TF+fmGPzFxihSppeQSQag8SlMwVq39iwY6KMqGMNxzyCyh4U8s2wg6fowNpNOaw6omeEK4GasWr9X7lBaAwnNwVbmz2Y/56EJ61d7mFnuq2PWxskBHaciLw9qzdi8enWNz149I5FvkkMu81nGK6rEb6YqoqYudujHaRE3EDsSsek9Jhkv86z2B/AJxvjiYgu6NQ4YETQLMhe2WzdtawTApnpQoo2w32wqkkPP7Jwnn85WRTo3mT58IsoJFeT2bhT9xe1TlKMrMAoZZsRhcx2qzAkse3eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736291087; c=relaxed/relaxed;
	bh=Nf1LfZ4qgJubCqyy9dabGr3PRYHGQFcY+zJZ/lt4blk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2t9sldZ0cxLMKGpd8/+qcvecSADIHtfCLIMpU7HRUteKf/JxK/l4scyDHFKN3E0yJ/+0esDS4cFID4sj2RznH27wvUUOedxT0+9sVoFWNPw+DW2Rav8ibpY5iV7+PqRKp/Ubd8aqQFqe8DlMEbbVGn5Oc+cWy1dtP0tUbolbxu8lQ6vTVnVctaMg2uKn+r4LywAgoV2Pr4gtJbr9InxjaO2GmJdPbEsRXgeyzFYJNVqUXehXANe99qXfepCF1993IKEansD7lAVC28+9uo9tUT0p/NXwvK2KWxm+cGUiMBv6TZbqvj1ZwzGSYIIdy6o4ckPq6bf5Ol3eiONuEq4bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ec+gu3yh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ec+gu3yh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSRTB4VSgz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 10:04:45 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21649a7bcdcso230168865ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 15:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736291083; x=1736895883; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf1LfZ4qgJubCqyy9dabGr3PRYHGQFcY+zJZ/lt4blk=;
        b=Ec+gu3yhaYQe34j07uW1wjvXZzreaDv5gKrKMlf5X3so34gkU6NVP0gF1wJ8DbnYMr
         U3YqqbvIlVW6aILLpLbgJWcq0jXbwauU2MdBo5Bx26vJG6d2wTc39w3xTX6l+5zWKfg6
         LHOk6UZq9agUFVYqDiR0i3mBKP53gH6LG8HUgxyhcnIsZ6AQ3BZo6doIu9oI7OK3n595
         3i84QNlcd0sV42NBZzrpHOTYxRLC6ipng1HNquKg+5+bmArl0Kj+MwvePW21u89t5D+7
         geoUiKbokOx2RzOSbPKYmv1GNfla/Ok0LlLIlV1rti8AkWguSwWNf3rHzCrVj/qzWO+r
         cOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736291083; x=1736895883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf1LfZ4qgJubCqyy9dabGr3PRYHGQFcY+zJZ/lt4blk=;
        b=vWREOrAzs56q3xSR6F3nX7AoJeQi+UjCPYm4j145DFofWEN2N09wrANX6DYH0jbGRe
         bYih4CBUSO/7xzST0mCxXoXNrI01ScuO3xDsD44/x+YhlCISsvuVE1Ame0R9VDGjX9F4
         sPYuItO3N8AKR9r/UYaIMHnGzcQJXWnc2J3W0pLry9pGwnzm4wADpHl/l56obC90tuuR
         9sDbXs+2aNYL21iPT6a46trjPnM6p7aT61q5dZo1Bn0iEXOPL8brwE7OSTKIwx4OXkLF
         /6r+Q/wtxfTiBh914quLOH45yEA9q9uR+UGIgIJo2cYdQgMTrCLwSOWD8sa7EwxX+Rrv
         lyBg==
X-Forwarded-Encrypted: i=1; AJvYcCUYmLs+1q43NzeQuoYiPUkF8Hwn0yyd8L98+qiUtsd8PRhJmIcVdnPYosr3TffwZHp4dwPCwh50xoh62pQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2keIAQWGhmMZDvZNDoODQGFNw1bftWB3aWqV6eTRwf/HJuZ9y
	UdHuICbZq0W1iUOBfX1ByrBco0INp+dqc4z/GCIhpkKd6AqSp89U
X-Gm-Gg: ASbGncu4tOy/Hq3n4Hck1MuduiarofqdKaoOmnFfk9QZw4jtAoMr9pen8ilWhqSIAqv
	V5KADtgnF6/KjgSpNNLp4NQa00HpuOotUwdE+wiHjiDkcrUWls7MsfcuZh95/vq4nLIlHw2Bpf8
	AH5n5fu5Nbw9X8VQaCyNMDzJop7SSpeqkRk6pidOGgSX/5uDI2YsAVQAPsn4EM6TNoAb7PyEheu
	PPyxtYpvEYHmOvuw7KJtsysRQTTdsZB1yZPnjAM8+bwtLclgBLDYum1
X-Google-Smtp-Source: AGHT+IGGsnhxMdKS+XqfH46crmyd2h1FdCEGKB61+UKyA9wPDqV3ce8dnCK+ft+o6nEtGVnODyxZ2g==
X-Received: by 2002:a05:6a20:2591:b0:1e0:cfc0:df34 with SMTP id adf61e73a8af0-1e88d0e2320mr1644455637.16.1736291083069;
        Tue, 07 Jan 2025 15:04:43 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8164c7sm34048123b3a.4.2025.01.07.15.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:04:42 -0800 (PST)
Date: Tue, 7 Jan 2025 15:04:40 -0800
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
Message-ID: <Z32zCDd2GnFPW465@yury-ThinkPad>
References: <20241228184949.31582-1-yury.norov@gmail.com>
 <20241228184949.31582-4-yury.norov@gmail.com>
 <Z32sncx9K4iFLsJN@li-4c4c4544-0047-5210-804b-b8c04f323634.ibm.com>
 <Z32t88W3biaZa7fH@yury-ThinkPad>
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
In-Reply-To: <Z32t88W3biaZa7fH@yury-ThinkPad>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 07, 2025 at 02:43:01PM -0800, Yury Norov wrote:
> On Tue, Jan 07, 2025 at 04:37:17PM -0600, Nick Child wrote:
> > On Sat, Dec 28, 2024 at 10:49:35AM -0800, Yury Norov wrote:
> > > A loop based on cpumask_next_wrap() opencodes the dedicated macro
> > > for_each_online_cpu_wrap(). Using the macro allows to avoid setting
> > > bits affinity mask more than once when stride >= num_online_cpus.
> > > 
> > > This also helps to drop cpumask handling code in the caller function.
> > > 
> > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > ---
> > >  drivers/net/ethernet/ibm/ibmvnic.c | 17 ++++++++++-------
> > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> > > index e95ae0d39948..4cfd90fb206b 100644
> > > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > > @@ -234,11 +234,16 @@ static int ibmvnic_set_queue_affinity(struct ibmvnic_sub_crq_queue *queue,
> > >  		(*stragglers)--;
> > >  	}
> > >  	/* atomic write is safer than writing bit by bit directly */
> > > -	for (i = 0; i < stride; i++) {
> > > -		cpumask_set_cpu(*cpu, mask);
> > > -		*cpu = cpumask_next_wrap(*cpu, cpu_online_mask,
> > > -					 nr_cpu_ids, false);
> > > +	for_each_online_cpu_wrap(i, *cpu) {
> > > +		if (!stride--)
> > > +			break;
> > > +		cpumask_set_cpu(i, mask);
> > >  	}
> > > +
> > > +	/* For the next queue we start from the first unused CPU in this queue */
> > > +	if (i < nr_cpu_ids)
> > > +		*cpu = i + 1;
> > > +
> > This should read '*cpu = i'. Since the loop breaks after incrementing i.
> > Thanks!
> 
> cpumask_next_wrap() makes '+ 1' for you. The for_each_cpu_wrap() starts
> exactly where you point. So, this '+1' needs to be explicit now.
> 
> Does that make sense?

Ah, I think I see what you mean. It should be like this, right?

  for_each_online_cpu_wrap(i, *cpu) {
  	if (!stride--) {
        	*cpu = i + 1;
  		break;
        }
  	cpumask_set_cpu(i, mask);
  }

