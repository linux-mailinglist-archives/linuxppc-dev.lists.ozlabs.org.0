Return-Path: <linuxppc-dev+bounces-13775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC56C33D54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 04:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1VpS2fZKz30Qk;
	Wed,  5 Nov 2025 14:16:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762312576;
	cv=none; b=g8T5U9BPH9vs3vlptPamJqhn7f/O7T3IP8mtx9RD2actS7uRB+5zlm8zr7E6gtNvXkTByfXGgkTmo/YaS+3V9ILIL5JKi2DYZabix8tVIZLJozNBNxdKf/wljbl8lsg4SDUAUagBw3ZJGNk4IKd9oqgTUoWV8YsAsuTHye/yyzFAk9XLQwKhkf1VqBj9qhj/eF2+yM7DYjXtS4HF55RKpHlCoR9DQxAOn1UdPnO+TRayTOk3yi4eUsh7rf8ifrT56AL2y17hcSyRWMeUoxWcg6F74lUYCGXUm85TIi1AFO1MNX65xVPnVFnfzSfOCztXVqCDM04auk8AtUi5h/mqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762312576; c=relaxed/relaxed;
	bh=khlr+nqfqO8zkgfz4nPt9sJu1gGHQI2iFDjbcvasM4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTK8b1vf5wmp8JHp5J+ADKtlw9RiSnW8nJNkAAMZOdfv8DO3VbM2QMcMsz5QN2mYSy5h5rn44PI1BzXyeaGjx9Qscvi7Ou+JcxNDFqb+sSyFwUerahOJ81pNXhX/iNLtRButWl86SflgKHAazdX33kduNk8pn+k1GrFYbT01xe863bqWt/LVRs4jpN5s/vXvqoJoHpcwP/gOwUruVQRhxSkvGPdg2cYlWsIlFxmQ1tdswiTPcpzqPcaCvUMbQ7nkEoyAnhxjGEvZfh3uen8AQIfXcyDQEpUnjnt+Zf+HTM+0Hg2CL0hrP0oTiruBWfrQ8TIL24tRiQn5LCVGmmQl9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QmPZBxzp; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QmPZBxzp; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QmPZBxzp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QmPZBxzp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1VpQ30Z2z306d
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:16:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762312568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khlr+nqfqO8zkgfz4nPt9sJu1gGHQI2iFDjbcvasM4k=;
	b=QmPZBxzptheZWWTda0fIEvbp9KF8dNEmgJvSCWSDmG4vWYBmGLGoO5qpahgFbX7wczpx+d
	O2J0XPYdvI6sn1s9VwA39ErpDI8k+nzjFN95Y8Yz4VxDgPfnY/MgbJdVWEg5MEOnNqWtJg
	T0OnyfXYuBRDkHAaPzm0uOkpYeHiqtA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762312568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khlr+nqfqO8zkgfz4nPt9sJu1gGHQI2iFDjbcvasM4k=;
	b=QmPZBxzptheZWWTda0fIEvbp9KF8dNEmgJvSCWSDmG4vWYBmGLGoO5qpahgFbX7wczpx+d
	O2J0XPYdvI6sn1s9VwA39ErpDI8k+nzjFN95Y8Yz4VxDgPfnY/MgbJdVWEg5MEOnNqWtJg
	T0OnyfXYuBRDkHAaPzm0uOkpYeHiqtA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-pcTzoig4Oy65rcC08Sm5fw-1; Tue,
 04 Nov 2025 22:16:06 -0500
X-MC-Unique: pcTzoig4Oy65rcC08Sm5fw-1
X-Mimecast-MFC-AGG-ID: pcTzoig4Oy65rcC08Sm5fw_1762312565
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41CD319560B2;
	Wed,  5 Nov 2025 03:16:04 +0000 (UTC)
Received: from localhost (unknown [10.72.112.190])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B8CB11956056;
	Wed,  5 Nov 2025 03:16:01 +0000 (UTC)
Date: Wed, 5 Nov 2025 11:15:57 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Jiri Bohac <jbohac@suse.cz>,
	Shivang Upadhyay <shivangu@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Subject: Re: [PATCH 0/2] Export kdump crashkernel CMA ranges
Message-ID: <aQrBbYVEQleExjpk@MiWiFi-R3L-srv>
References: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/03/25 at 09:28am, Sourabh Jain wrote:
> /sys/kernel/kexec_crash_cma_ranges to export all CMA regions reserved
> for the crashkernel to user-space. This enables user-space tools
> configuring kdump to determine the amount of memory reserved for the
> crashkernel. When CMA is used for crashkernel allocation, tools can use
> this information to warn users that attempting to capture user pages
> while CMA reservation is active may lead to unreliable or incomplete
> dump capture.
> 
> While adding documentation for the new sysfs interface, I realized that
> there was no ABI document for the existing kexec and kdump sysfs
> interfaces, so I added one.
> 
> The first patch adds the ABI documentation for the existing kexec and
> kdump sysfs interfaces, and the second patch adds the
> /sys/kernel/kexec_crash_cma_ranges sysfs interface along with its
> corresponding ABI documentation.
> 
> *Seeking opinions*
> There are already four kexec/kdump sysfs entries under /sys/kernel/,
> and this patch series adds one more. Should we consider moving them to
> a separate directory, such as /sys/kernel/kexec, to avoid polluting
> /sys/kernel/? For backward compatibility, we can create symlinks at
> the old locations for sometime and remove them in the future.

That sounds a good idea, will you do it in v2? Because otherwise the
kexec_crash_cma_ranges need be moved too.


> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
> 
> Sourabh Jain (2):
>   Documentation/ABI: add kexec and kdump sysfs interface
>   crash: export crashkernel CMA reservation to userspace
> 
>  .../ABI/testing/sysfs-kernel-kexec-kdump      | 53 +++++++++++++++++++
>  kernel/ksysfs.c                               | 17 ++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> 
> -- 
> 2.51.0
> 


