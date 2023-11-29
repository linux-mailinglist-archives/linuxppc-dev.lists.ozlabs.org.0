Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74E7FE24A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 22:49:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjlOCoal;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjlOCoal;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgXzb71MYz3vwR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 08:49:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjlOCoal;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjlOCoal;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgXts0Ljlz3cmw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 08:45:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701294335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3xWVWUZPbk5MGMDQz7HZH6VD2zILEgQvXP9r7AbwIo=;
	b=BjlOCoalbkn4jGICPqxsb8roiqjhVmlCLbZKEPtnUC1od5fig3mKiIA9djw1ofGrX9scXy
	Org9HuR6pwwn5vZWDZkrMV+KIwXKeHHlrvUtdhZRECqym1EPQ9h+kXyOVEb6XLsKU83pC7
	VCS70UlFhfr/obzUbQjDngQAOkM0d7k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701294335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3xWVWUZPbk5MGMDQz7HZH6VD2zILEgQvXP9r7AbwIo=;
	b=BjlOCoalbkn4jGICPqxsb8roiqjhVmlCLbZKEPtnUC1od5fig3mKiIA9djw1ofGrX9scXy
	Org9HuR6pwwn5vZWDZkrMV+KIwXKeHHlrvUtdhZRECqym1EPQ9h+kXyOVEb6XLsKU83pC7
	VCS70UlFhfr/obzUbQjDngQAOkM0d7k=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-TICnx8CXNumPO9pzPMblHA-1; Wed, 29 Nov 2023 16:45:33 -0500
X-MC-Unique: TICnx8CXNumPO9pzPMblHA-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-58a91cf3f97so336567eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 13:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701294333; x=1701899133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3xWVWUZPbk5MGMDQz7HZH6VD2zILEgQvXP9r7AbwIo=;
        b=gXWlg4fx2JvuDSy59G6X0+onqHM/ElUqslQGIhOJ+lFZJWquOjbgDhtJ+Vbn+9gNEX
         n+vUj/KYONZdVHgqddB802YLEX9JLRODwKpLa2/e282pCt+DyIQU4myJWZkJRYYtalx1
         veNpvZvLQnQpHH/iCfD8EMz3o0z+5goVHIYui/NpQbHmbMaa4ycQcHtzkpEV12VV+bqN
         Z/hPyxKRzJDTlFmYGuif2fcoQV+myK99Rfn5PhvEGS5qbHD4HXvgly7ktLvtH5+2uZJD
         KHxK6hKsAyFcD3cZXw651ZXMSb5iFR07k7FDHof3f8pn1CvIkpESLBNpCnn9tqcPb9jp
         poAw==
X-Gm-Message-State: AOJu0YxWYGk4isfIBlsgjlMhCm15ZWRCEvBuWQ+CDraFMvX4N+MCCwlL
	goqsaUC85MC73SukB0hviiX0vhRQTqsrPb5O5EtlCn2a4MxzvUlsDBRMN5YMzRQOO5yQ4V0ZfLD
	/cjlIMQiFnkbXBiCZZB5VGG04oA==
X-Received: by 2002:a05:6820:513:b0:58d:6217:795e with SMTP id m19-20020a056820051300b0058d6217795emr19629102ooj.8.1701294333000;
        Wed, 29 Nov 2023 13:45:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiX/Tvc+toAwd/tY9Rv762mlPV5wQvlo/Dm5/DrBUxi70aCrX/U4468O+1d5CLlBkm80dRJw==
X-Received: by 2002:a05:6820:513:b0:58d:6217:795e with SMTP id m19-20020a056820051300b0058d6217795emr19629065ooj.8.1701294332763;
        Wed, 29 Nov 2023 13:45:32 -0800 (PST)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id u38-20020a4a8c29000000b0057bb326cad4sm2486047ooj.33.2023.11.29.13.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:45:32 -0800 (PST)
Date: Wed, 29 Nov 2023 14:45:30 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
Message-ID: <20231129144530.16c18552.alex.williamson@redhat.com>
In-Reply-To: <ZWeDZ76VkRMbHEGl@google.com>
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
	<87edgy87ig.fsf@mail.lhotse>
	<ZWagNsu1XQIqk5z9@google.com>
	<20231129124821.GU436702@nvidia.com>
	<ZWeDZ76VkRMbHEGl@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Nov 2023 10:31:03 -0800
Sean Christopherson <seanjc@google.com> wrote:

> On Wed, Nov 29, 2023, Jason Gunthorpe wrote:
> > On Tue, Nov 28, 2023 at 06:21:42PM -0800, Sean Christopherson wrote:  
> > > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > > index 454e9295970c..a65b2513f8cd 100644
> > > --- a/include/linux/vfio.h
> > > +++ b/include/linux/vfio.h
> > > @@ -289,16 +289,12 @@ void vfio_combine_iova_ranges(struct rb_root_cached *root, u32 cur_nodes,
> > >  /*
> > >   * External user API
> > >   */
> > > -#if IS_ENABLED(CONFIG_VFIO_GROUP)
> > >  struct iommu_group *vfio_file_iommu_group(struct file *file);
> > > +
> > > +#if IS_ENABLED(CONFIG_VFIO_GROUP)
> > >  bool vfio_file_is_group(struct file *file);
> > >  bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
> > >  #else
> > > -static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
> > > -{
> > > -       return NULL;
> > > -}
> > > -
> > >  static inline bool vfio_file_is_group(struct file *file)
> > >  {
> > >         return false;
> > >   
> > 
> > So you symbol get on a symbol that can never be defined? Still says to
> > me the kconfig needs fixing :|  
> 
> Yeah, I completely agree, and if KVM didn't already rely on this horrific
> behavior and there wasn't a more complete overhaul in-flight, I wouldn't suggest
> this.
> 
> I'll send the KVM Kconfig/Makefile cleanups from my "Hide KVM internals from others"
> series separately (which is still the bulk of the series) so as to prioritize
> getting the cleanups landed.
> 

Seems we have agreement and confirmation of the fix above as an
interim, do you want to post it formally and I can pick it up for
v6.7-rc?  Thanks,

Alex

