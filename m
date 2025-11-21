Return-Path: <linuxppc-dev+bounces-14397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E3C77279
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:23:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCLCP6bNCz2yD5;
	Fri, 21 Nov 2025 14:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763695409;
	cv=none; b=Q4VHTs7yOtJ+mlmXOQQg8ShPNmK+rJtufHXpnUMzwYX+a5C9N2HTQrccWJRruvQUT3sIlilXX+X0BNKvgFVhAyhPUyIimXwB0Yp28Y3Ty9b3HmJklu8JKmxPHrCJQ5c9HUhRynXUxbznggtk25CBUPQFmdRoVFta4j8TOBTrfJWEi5aCc4PCdqq2H6Xwyf0A2svYYaAzT6dJSvsp1xUYWN0CfMY+QJREWjKJWWYcLNRz1YiwXdEwryOV2UlkY2f0xTI+B0NZnMtMQnJXtotdy2itCus61bRgUeyzP7Neo8aRgo+ewyEsiJ9boYI/IEJhjF0ER623E7xG/gJ30rpfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763695409; c=relaxed/relaxed;
	bh=V6+6N9+a6Rle5k9y2X7Rh5H8fLanRq0TwohIxyV0JFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5SfZ6cs2zWwFs9aAymt3W5iUqSMK2n7CjTxnqh1rImeiHUMArtPRJ4738dBaVzXsiTxzzRM+1CpnTh07G+iEn32Xu6cXFbm92b2ISrdp0m23+BvC7OUw32TRMUf1oQ04GxHrlkp4uMswkogYYp3teBPr0KG76SBbBQjsEtx8ClqiB/43+uCb1lCnxUz/Cd1OLa1f1a8vzz3+wNSuFsxeVQLGVItUekb7Va/taxs4vzCALlKbc6/qGnVSqk8r6LzNtsiwX/nLlgBA/N9LC5MHRfdG3tVmaxGnaSZCOD5IzlYrWzLLzBwfKCJZp+bfTiki8QcIz3dc3zsgADWNvF0NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpTkMhl0; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpTkMhl0; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpTkMhl0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpTkMhl0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCLCN4yBNz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763695402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V6+6N9+a6Rle5k9y2X7Rh5H8fLanRq0TwohIxyV0JFM=;
	b=PpTkMhl0Dpfp2gpZI5j8WkZhrhlX11C3ADjnirdaDH12RZODNyel8ZWWiTt/FqoHLAKk/b
	pIhzqtY5NAXYG5GacrMAa/bqXxd4cW4EnzpAhrBJdUTZLzU5Ynfg0embajRGwjtXeupLYV
	VXuWRXb53oz2oYdpidd9ueDgq3dRek0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763695402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V6+6N9+a6Rle5k9y2X7Rh5H8fLanRq0TwohIxyV0JFM=;
	b=PpTkMhl0Dpfp2gpZI5j8WkZhrhlX11C3ADjnirdaDH12RZODNyel8ZWWiTt/FqoHLAKk/b
	pIhzqtY5NAXYG5GacrMAa/bqXxd4cW4EnzpAhrBJdUTZLzU5Ynfg0embajRGwjtXeupLYV
	VXuWRXb53oz2oYdpidd9ueDgq3dRek0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-21-Ux9GdJjnMkqHNIR-ISlWWg-1; Thu,
 20 Nov 2025 22:23:18 -0500
X-MC-Unique: Ux9GdJjnMkqHNIR-ISlWWg-1
X-Mimecast-MFC-AGG-ID: Ux9GdJjnMkqHNIR-ISlWWg_1763695396
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61774195423A;
	Fri, 21 Nov 2025 03:23:15 +0000 (UTC)
Received: from localhost (unknown [10.72.112.24])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 19D0E1800451;
	Fri, 21 Nov 2025 03:23:11 +0000 (UTC)
Date: Fri, 21 Nov 2025 11:23:07 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Aditya Gupta <adityag@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Young <dyoung@redhat.com>,
	Hari Bathini <hbathini@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Pingfan Liu <piliu@redhat.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>,
	Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v6 0/3] kexec: reorganize kexec and kdump sysfs
Message-ID: <aR/bG4MCKGpunwe4@MiWiFi-R3L-srv>
References: <20251118114507.1769455-1-sourabhjain@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118114507.1769455-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/18/25 at 05:15pm, Sourabh Jain wrote:
> All existing kexec and kdump sysfs entries are moved to a new location,
> /sys/kernel/kexec, to keep /sys/kernel/ clean and better organized.
> Symlinks are created at the old locations for backward compatibility and
> can be removed in the future [01/03].
> 
> While doing this cleanup, the old kexec and kdump sysfs entries are
> marked as deprecated in the existing ABI documentation [02/03]. This
> makes it clear that these older interfaces should no longer be used.
> New ABI documentation is added to describe the reorganized interfaces
> [03/03], so users and tools can rely on the updated sysfs interfaces
> going forward.
> 
> Changlog:
> ---------
> 
> v4 -> v5:
>  https://lore.kernel.org/all/20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org/
>  - Splitted patch series from the above patch series
> 
> v5 -> v6:
>  - Move /sys/kernel/kexec_crash_cma_ranges also to new /sys/kernel/kexec node
>  - Update commit messages
> 
> Note:
> This patch series is dependent on the patches:
> https://lore.kernel.org/all/20251117035153.1199665-1-sourabhjain@linux.ibm.com/
> https://lore.kernel.org/all/20251118071023.1673329-1-sourabhjain@linux.ibm.com/

To the series,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> Cc: Aditya Gupta <adityag@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> Cc: Pingfan Liu <piliu@redhat.com>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
> 
> Sourabh Jain (3):
>   kexec: move sysfs entries to /sys/kernel/kexec
>   Documentation/ABI: mark old kexec sysfs deprecated
>   Documentation/ABI: new kexec and kdump sysfs interface
> 
>  .../ABI/obsolete/sysfs-kernel-kexec-kdump     |  71 +++++++++
>  .../ABI/testing/sysfs-kernel-kexec-kdump      |  26 ++--
>  kernel/kexec_core.c                           | 141 ++++++++++++++++++
>  kernel/ksysfs.c                               |  89 +----------
>  4 files changed, 230 insertions(+), 97 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
> 
> -- 
> 2.51.1
> 


