Return-Path: <linuxppc-dev+bounces-136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642195538D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 00:59:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AmsXAnYr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wly9M3ml2z2xnc;
	Sat, 17 Aug 2024 08:59:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AmsXAnYr;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wly9L01Kkz2xn3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 08:59:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723849156;
	bh=roYcbEwUkCK44wHMpRdhuKBnVEwlCVBSQUtDw2Hz8SQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AmsXAnYrY7hw3WpwHZSqkOCASktJ+k24PxqopHBvkPLi7tL4eqiMGX1vl5Q89z9wP
	 8tIbivB12uj9UCXGgQtlB41h3EwVZcgoiI/jZTU7cshhYc+tISuLvHlK4M9HkHU0Zg
	 4i7stxOCnT0f8dxqG0Pzpcb9wlfbRYRiDTMo0U2iUw1RMIrkUflE5zGcIzOhIacfYp
	 Uk2k/gT7vOuHZieR3s8j4N8v7KmFKFaxCoN4gC64XvSN145UbGNntsdA25H5DQEtyr
	 jsp9ZnCSVk30IwL5Wp6RZF40Iwak19xzJB+P40Pkhmvvvj99sqDcsAQfGjI2flpb+s
	 segbiMtOphFnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wly9G30LYz4wb0;
	Sat, 17 Aug 2024 08:59:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lizhi Hou
 <lizhi.hou@amd.com>, Saravana Kannan <saravanak@google.com>, Vaibhav Jain
 <vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan
 Srinivasan <svaidy@linux.ibm.com>, Kowshik Jois B S
 <kowsjois@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>,
 kernel-team@lists.ubuntu.com, Stefan Bader <stefan.bader@canonical.com>
Subject: Re: [PATCH v3] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
In-Reply-To: <20240816180441.81f4d694-3b-amachhiw@linux.ibm.com>
References: <20240806200059.GA74866@bhelgaas> <87h6bm1ngo.fsf@mail.lhotse>
 <20240816180441.81f4d694-3b-amachhiw@linux.ibm.com>
Date: Sat, 17 Aug 2024 08:59:13 +1000
Message-ID: <87o75s2hxa.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Machhiwal <amachhiw@linux.ibm.com> writes:
> On 2024/08/15 01:20 PM, Michael Ellerman wrote:
>> Bjorn Helgaas <helgaas@kernel.org> writes:
>> > On Sat, Aug 03, 2024 at 12:03:25AM +0530, Amit Machhiwal wrote:
>> >> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
>> >> of a PCI device attached to a PCI-bridge causes following kernel Oops on
>> >> a pseries KVM guest:
>> >
>> > What is unique about pseries here?  There's nothing specific to
>> > pseries in the patch, so I would expect this to be a generic problem
>> > on any arch.
>> >
>> >>  RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>> >>  Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>> >>  BUG: Unable to handle kernel data access on read at 0x10ec00000048
>> >
>> > Weird address.  I would expect NULL or something.  Where did this
>> > non-NULL pointer come from?
>> 
>> It originally comes from np->data, which is supposed to be an
>> of_changeset.
>> 
>> The powerpc code also uses np->data for the struct pci_dn pointer, see
>> pci_add_device_node_info().
>> 
>> I wonder if that's why it's non-NULL?
>
> I'm also looking into the code to figure out where's that value coming from. I
> will update as soon as I get there.

Thanks.
 
>> Amit, do we have exact steps to reproduce this? I poked around a bit but
>> couldn't get it to trigger.
>
> Sure, below are the steps:
>
> 1. Set CONFIG_PCI_DYNAMIC_OF_NODES=y in the kernel config and compile (Fedora
>    has it disabled in it's distro config, Ubuntu has it enabled but will have it
>    disabled in the next update)
>
> 2. If you are using Fedora cloud images, make sure you've these packages
>    installed:
>     $ rpm -qa | grep -e 'ppc64-diag\|powerpc-utils'
>     powerpc-utils-core-1.3.11-6.fc40.ppc64le
>     powerpc-utils-1.3.11-6.fc40.ppc64le
>     ppc64-diag-rtas-2.7.9-6.fc40.ppc64le
>     ppc64-diag-2.7.9-6.fc40.ppc64le
>
> 3. Hotplug a pci device as follows:
>     virsh attach-interface <domain_name> bridge --source virbr0

I don't use virsh :)

Any idea how to do it with just qemu monitor commands?

cheers

