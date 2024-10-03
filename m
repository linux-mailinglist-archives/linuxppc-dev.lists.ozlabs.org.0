Return-Path: <linuxppc-dev+bounces-1753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7E98FA0B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 00:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKRdY12FHz2y1W;
	Fri,  4 Oct 2024 08:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727962738;
	cv=none; b=F7u0sO2jNIMBXYdtvaS3w79/w8+cowLiMffp+eznpNoc4LU/OQxFtesQNFLArgHAVOqn4uK+arMCVDobTLQJ+N0VWXol9zC6r9DJ8qfqbqzCtDfak5k6yqYh72uUa/Etsbkye9mUYNzC3vZGpZQTx5aTBGaFrD/hUaMoW43FrJw18Zz3NLglxDN+3/IxLU8GDT1rawtOih1BXT6A3KZC0EYq5dKfVURAvtHmINg1rwBY9sQx/1+m1y6s8r05Cfe1kEEMmzA4uzGgCGu1OF3oYQAGOmyxPP/kXveoCRIjQFX8xiEhZU9C9z9Nc1WaW0Rrmw+m++6O4NIRQC3i6drI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727962738; c=relaxed/relaxed;
	bh=7cYlQ8sS3dSodfjWbJOUDRW+BCri6YPN6Z8wFgeEOOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5nIxlMyVwPt3CcgX8Plwo5LnmIKfpiTx5ZKnoLGIL5Dz3coJzaCXhMHqxoivp1jTERcd5+HHiCZOxdxj89cThP9kDjvdIKYHkED5uBGeG1RDQde1MBaFpLgUI7utNr7IafmjC6syJdD3mj4qVoilKO/zL+qWlbjcz+kR9mqtyEPScNAsgbxzagn6t973Zu+vCzUORBCDgKnh0jxreuhULvJc4FIlqif+ZJPCyDVVO+PbKfaHh/C9QG46JmiigjBMmds/ZQvp2Fn34X/zvwun6EpnpPIcbmNSY913uu6myT5KWWuCs7NputYmjAXqggob4GA3kkOL3+rbMlHWubNOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jaW1lYJA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jaW1lYJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKCSd0kdzz2xqc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 23:38:55 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4581ee65b46so8462171cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Oct 2024 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1727962731; x=1728567531; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cYlQ8sS3dSodfjWbJOUDRW+BCri6YPN6Z8wFgeEOOM=;
        b=jaW1lYJAPTjBvi+FRtLWheR3GwjvTMyfcuMJnCrRQpl9Q/MWJnK9aGDJMf7xuwEZ99
         xdEz1C8IroKxHn78/TttsSGkAmMgHA4C2EkHFWw7KF1qAuEuEZaQZ9FD+WaopWbaAW5B
         caX3RKNa/EtOb+/bXMjDNBBemEbyW9LC6HUoS8YQmXX+sMsC02H0B9H89dprE+fCNP5w
         +UA7mfKzRkMK1pDDY88+aWYuwcwAGOkhcQhWJJIAJlKh7ECM2aq7e/aWdRSsmUYAFUqA
         XhN9C58nB+pswI/UYl+V7/K4dFoDt3ZVTdafWDVTIWS2Pog+9AT8/8/iM0nkIwwI+4Vk
         clmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727962731; x=1728567531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cYlQ8sS3dSodfjWbJOUDRW+BCri6YPN6Z8wFgeEOOM=;
        b=qREyHbf6WjwszNV2Ljt2NiT3EkW3xPcvQ7TYTSe58gVZKksLtUca8s3PQiS6FHu1gs
         zviFZRyLHc5lHnO/tgnMGT5ZVcAucDPTWpcfnpPPovdThM2YKjLMHu9n+Lfc4JkyH1dM
         ZlNPs16QQ8fkGX7/O/MCvLNtBFeRmRx/Hhu865ygTVpoMshvKE9TGPj+G5owKksGDZPl
         DqcK7Mmz7NtV5PoJMc7Q7IGzvqErMX8SMZ8MoIqnb9k4oXM03uFm2EFbLwu1Eoxf2PoF
         gyTF+n2beaMpIDctB8SBHzUCWnZnuGNTbb+iodHXk0p4oIVlGGEQDqqjJSzfQKkSZnwg
         t02w==
X-Forwarded-Encrypted: i=1; AJvYcCUEtP7mFh+KF0gRuoHCUxdIdonUvGpcXYm0rD8tESL6BtQWMN9AlhVb7eQpmd0IXuElV9XpXlwKud+hAIE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmyWJxePw9O5Xvr5E+kKBDT2hxBTs3YlJzT39xyBoz7XrEk7m4
	UuPREoqnVnTPIzVRaRTctXVtIcpjDIxi1zJhD3kX09opJN5Paxe9v7Q5OzfjJ9Y=
X-Google-Smtp-Source: AGHT+IEeXln8uxBBs7r0qbtw2wolKdiK0oe/fV/z2xXXfZUZhaM6OzDUMtsWVXSO1oxDdjO6OayXDA==
X-Received: by 2002:ac8:58c4:0:b0:458:2795:4853 with SMTP id d75a77b69052e-45d804d3296mr96964851cf.32.1727962730877;
        Thu, 03 Oct 2024 06:38:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45d92ed4dcesm5550881cf.69.2024.10.03.06.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 06:38:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1swM2b-00ASZK-KP;
	Thu, 03 Oct 2024 10:38:49 -0300
Date: Thu, 3 Oct 2024 10:38:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	aneesh kumar <aneesh.kumar@kernel.org>,
	naveen n rao <naveen.n.rao@linux.ibm.com>,
	gbatra <gbatra@linux.vnet.ibm.com>, brking@linux.vnet.ibm.com,
	Alexey Kardashevskiy <aik@ozlabs.ru>, robh@kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	kvm <kvm@vger.kernel.org>, aik <aik@amd.com>, msuchanek@suse.de,
	jroedel <jroedel@suse.de>, vaibhav <vaibhav@linux.ibm.com>,
	svaidy@linux.ibm.com
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/iommu: Bring back userspace view
 for single level TCE tables
Message-ID: <20241003133849.GD2456194@ziepe.ca>
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
 <171026725393.8367.17497620074051138306.stgit@linux.ibm.com>
 <20240319143202.GA66976@ziepe.ca>
 <1386271253.24278379.1710873411133.JavaMail.zimbra@raptorengineeringinc.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386271253.24278379.1710873411133.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 19, 2024 at 01:36:51PM -0500, Timothy Pearson wrote:
> > On Tue, Mar 12, 2024 at 01:14:20PM -0500, Shivaprasad G Bhat wrote:
> >> The commit 090bad39b237a ("powerpc/powernv: Add indirect levels to
> >> it_userspace") which implemented the tce indirect levels
> >> support for PowerNV ended up removing the single level support
> >> which existed by default(generic tce_iommu_userspace_view_alloc/free()
> >> calls). On pSeries the TCEs are single level, and the allocation
> >> of userspace view is lost with the removal of generic code.
> > 
> > :( :(
> > 
> > If this has been broken since 2018 and nobody cared till now can we
> > please go in a direction of moving this code to the new iommu APIs
> > instead of doubling down on more of this old stuff that apparently
> > almost nobody cares about ??
> 
> Just FYI Raptor is working on porting things over to the new APIs.
> RFC patches should be posted in the next week or two.

There was a discussion about this at LPC a few weeks ago, did any
patches get prepared?

Jason

