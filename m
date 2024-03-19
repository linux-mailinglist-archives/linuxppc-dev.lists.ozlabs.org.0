Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AE880400
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 18:55:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kPVWUFLC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzfWg4ZlPz3dXN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 04:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kPVWUFLC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzfVx0JnJz3c4C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 04:54:31 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-22200c78d4fso2467889fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1710870869; x=1711475669; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HF6Vl5KL4xpUREI17F/A98SYy0fCl/Pf+Aw5AKvgvKY=;
        b=kPVWUFLCfuZsdLp4Q+L1wPjZGr2pfna34ZP1Hgkj6CMeCyhbxiKyQiR/lwY6LFQ5sV
         /pqkuNRBtAP6bDbm27R64pmAQXQ23wqHFYNkqNS7lZh+VoO0ZkvDD5jk8EdX1klwebhT
         ZtWy6q7s1OoAoPLuty6jN18xU+C0NWcras1UyjrivT/YQyswtLdN29H9pHVyncQyoEgn
         KP9onPOogUo0mCUdSozwXRou90RvUnQ3pHyMmfNoO0wjs7TTgRDbhp5oDY3D5eAqpbA0
         GKZsKTX1zBLo/bZXNzAc0EPhTN1xQMuAFKXItuVsYyiRnV/3/9LIAKWxFZZT4FX4h9sX
         Zyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710870869; x=1711475669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HF6Vl5KL4xpUREI17F/A98SYy0fCl/Pf+Aw5AKvgvKY=;
        b=SpJ2McU0Cg+54b8U8aIzA73e8KuAXQ6drOfopCwYRkU/d5xCBtq64Hz/bTOrOH1mJH
         9BfWzs32QtmQn+axmIlqDd/ztvX71Gg6X4q64SLkllg/vomRtRZ/eQw+0SR+mM/+PXzj
         OK+wOMXsMTw4MsChquzY+63UtMjMX3GZovH1iuvdolW6vUhbZxfAzdwV1ufBcm9viGSS
         EdP8Q39wjIjb16e/ahVW2d3P+eXNDWC9z8gkz7cF78ztTPn21VKBPoJx+N1Tz7jq/XX+
         e58m40L8GVLlV6WtX3Q2Oja6CPnkQTe5PxmlDiEQO1RmDkyLZnkZGFzGFhTDuaBPbwPz
         QNdA==
X-Forwarded-Encrypted: i=1; AJvYcCWZLnQQ8A/5NpW+1+koTmqkIs/9VYkq09ky+ZA7BPmLqvyLfI591Z7mQH3XUlBJGLK5+MMc7t1rteoKfLzeGfJ06aoSWIiyNT3GH2G00g==
X-Gm-Message-State: AOJu0YyXW3ufdh+yW8C7XAiRnZP6tpgct2GBINxkn51au1B3U0FFHGcT
	XSczyBK5btBhd126R14K2+YOg8wnvi6kWeLkczWrJEo60xl02wB6pup0X4moVy8=
X-Google-Smtp-Source: AGHT+IHVIAnHnQZiZoDX/pbyOjP2H640ehA0I39KqURFs2tz8LL5UStmL8zs/cTqG9a5m1PaAXGInQ==
X-Received: by 2002:a05:6871:110:b0:221:a517:17ec with SMTP id y16-20020a056871011000b00221a51717ecmr16967034oab.57.1710870868900;
        Tue, 19 Mar 2024 10:54:28 -0700 (PDT)
Received: from ziepe.ca ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id gh11-20020a056638698b00b00477716fcbb8sm2429986jab.40.2024.03.19.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 10:54:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rmaVW-001eUR-KB;
	Tue, 19 Mar 2024 11:32:02 -0300
Date: Tue, 19 Mar 2024 11:32:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/iommu: Bring back userspace view
 for single level TCE tables
Message-ID: <20240319143202.GA66976@ziepe.ca>
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
 <171026725393.8367.17497620074051138306.stgit@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171026725393.8367.17497620074051138306.stgit@linux.ibm.com>
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, kvm@vger.kernel.org, gbatra@linux.vnet.ibm.com, aik@ozlabs.ru, alex.williamson@redhat.com, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 12, 2024 at 01:14:20PM -0500, Shivaprasad G Bhat wrote:
> The commit 090bad39b237a ("powerpc/powernv: Add indirect levels to
> it_userspace") which implemented the tce indirect levels
> support for PowerNV ended up removing the single level support
> which existed by default(generic tce_iommu_userspace_view_alloc/free()
> calls). On pSeries the TCEs are single level, and the allocation
> of userspace view is lost with the removal of generic code.

:( :(

If this has been broken since 2018 and nobody cared till now can we
please go in a direction of moving this code to the new iommu APIs
instead of doubling down on more of this old stuff that apparently
almost nobody cares about ??

Jason
