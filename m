Return-Path: <linuxppc-dev+bounces-5762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A1A24701
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2025 05:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YlKNl4VlPz2yN2;
	Sat,  1 Feb 2025 15:22:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738383751;
	cv=none; b=Z+uDrRz5zWNfxLrsH0YktrIOTsbM4p5rLSvIHKIoN3gbrpx82aXouVwNAaCAcA03Dx+9RoQF4QRVHp8rGl05Whb8C14YgUA79e7zmxNJ1kiFl8uWpIzbpYEmctnK4+AbjQaRVxA8JWNLU8HH78pl3Ev80vVPBwB2597+a9UHwjxwWcgaJtCNBjbobwECa/x1eccFmHwhs/ctAgTMeGJY6C3iZsO5ooXno2LroCSgmYzHL5c6mYJrl6KRvc0ugTtdPbhQajeUjGOZCHRTdmMKL62TBeKSDVcv8r7L6L8p1lbvzEVa4xE9/VDo6vv9gQH7/xeOxeGG8p7XA9qXfapDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738383751; c=relaxed/relaxed;
	bh=5Ig6TH7qnMW9vqfBPnMTJLnOHwh56eOqpsqPuSlb7kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnduIyzZ4H5rCn/3TuManX/wdUJmZNEgxdyv5Cs7mRzKPaFQeOCIktsdibkPwpbTQ2xSs1vZUj8W3SG33/GhHm9Xz4jVdJmvVcx/9IAHJabXSy5ybb0Df/Ud7FEmOkrj+3LBiLwStqGFTBqCcGJvVV6tkQsQMvekI7XzK9ViBVoGl8w3+rKSAxHgIbRMs5Gnh5PpTsw1KhvbIf4ohmX4fFcIDxpvTOlz+6wPDwimLhrTStFf9o5WrTXaN1P2/X/lC8gornWN4Le1AFG1V8JbpdRjxPdnWgYZ5iGoaF8n26CHuBjaN6uDqGx0RJ1vfUmwU5aELzLStM3cdsup7cwQKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YDV3/DSa; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YDV3/DSa; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YDV3/DSa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YDV3/DSa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YlKNk43Qtz2xxx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 15:22:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738383743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ig6TH7qnMW9vqfBPnMTJLnOHwh56eOqpsqPuSlb7kQ=;
	b=YDV3/DSaDSzbvB0otft4b/a0DksOLeHp5GBLwQ2N0k8v/JX/15SL/y/mVgBoRakVeqWJyc
	lsUYEQWAn/PLP6hwZgTUrJqJkFRaCSAsCM3mw9E1FqrdRDIrZNkUDGht4YzsdKz1A7LMSu
	/s/ffwn2o4fgSamvJxW2hQeZctMCe9Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738383743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ig6TH7qnMW9vqfBPnMTJLnOHwh56eOqpsqPuSlb7kQ=;
	b=YDV3/DSaDSzbvB0otft4b/a0DksOLeHp5GBLwQ2N0k8v/JX/15SL/y/mVgBoRakVeqWJyc
	lsUYEQWAn/PLP6hwZgTUrJqJkFRaCSAsCM3mw9E1FqrdRDIrZNkUDGht4YzsdKz1A7LMSu
	/s/ffwn2o4fgSamvJxW2hQeZctMCe9Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-zf_HO1DfMT-xwtjDhBfBdQ-1; Fri,
 31 Jan 2025 23:22:19 -0500
X-MC-Unique: zf_HO1DfMT-xwtjDhBfBdQ-1
X-Mimecast-MFC-AGG-ID: zf_HO1DfMT-xwtjDhBfBdQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F38A180036E;
	Sat,  1 Feb 2025 04:22:17 +0000 (UTC)
Received: from localhost (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA93D180035E;
	Sat,  1 Feb 2025 04:22:14 +0000 (UTC)
Date: Sat, 1 Feb 2025 12:22:09 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] crash: Let arch decide usable memory range in
 reserved area
Message-ID: <Z52hUz5/nZhzTUb4@fedora>
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
 <20250131113830.925179-4-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20250131113830.925179-4-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/31/25 at 05:08pm, Sourabh Jain wrote:
> Although the crashkernel area is reserved, on architectures like
> PowerPC, it is possible for the crashkernel reserved area to contain
> components like RTAS, TCE, OPAL, etc. To avoid placing kexec segments
> over these components, PowerPC has its own set of APIs to locate holes
> in the crashkernel reserved area.
> 
> Add an arch hook in the generic locate mem hole APIs so that
> architectures can handle such special regions in the crashkernel area
> while locating memory holes for kexec segments using generic APIs.
> With this, a lot of redundant arch-specific code can be removed, as it
> performs the exact same job as the generic APIs.
> 
> To keep the generic and arch-specific changes separate, the changes
> related to moving PowerPC to use the generic APIs and the removal of
> PowerPC-specific APIs for memory hole allocation are done in a
> subsequent patch titled "powerpc/crash: Use generic APIs to locate
> memory hole for kdump.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  include/linux/kexec.h |  9 +++++++++
>  kernel/kexec_file.c   | 12 ++++++++++++
>  2 files changed, 21 insertions(+)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>


