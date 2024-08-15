Return-Path: <linuxppc-dev+bounces-97-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1370295283B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 05:20:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nx1z/6z4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wkr3c493tz2yHL;
	Thu, 15 Aug 2024 13:20:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nx1z/6z4;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wkr3b0mTMz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 13:20:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723692027;
	bh=9heJ5lej0lmzgaMPk+qYVLtyn5V38y1FDbls6T33vyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nx1z/6z45RHAu8+PoDYNG6J4zfHMH/t7JHlIzyjBMY58UDdiAp5GnNgOLaSZwrH77
	 +qIwqMJS4Yslrv1XBPWnLwDgVhTeg6gzGdeFPcHHL3AOEVRVZzKR4+4E2UsJ/NOkjd
	 cVPTytEN8Bz1Z5Z5/oux2/Z8ibioei0xEPUGwGXhUklhMnvXkJBLcIfeRGoLPjr647
	 aPIBx5qROon+XOdmmHMDrLabvL1U+v3avgXNASlNtgbtFJhalqFRaTHQVGrB5ec2S4
	 twYsPLD9YfqJPY56NcdwLyOwPtA4a4gvzyeVUHUpOEkHUCzpAiAqje24tCaZDWSE+j
	 tXznfHA+2Zjfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wkr3X5dtxz4x1H;
	Thu, 15 Aug 2024 13:20:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>, Amit Machhiwal
 <amachhiw@linux.ibm.com>, Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lizhi Hou
 <lizhi.hou@amd.com>, Saravana Kannan <saravanak@google.com>, Vaibhav Jain
 <vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan
 Srinivasan <svaidy@linux.ibm.com>, Kowshik Jois B S
 <kowsjois@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>,
 kernel-team@lists.ubuntu.com, Stefan Bader <stefan.bader@canonical.com>
Subject: Re: [PATCH v3] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
In-Reply-To: <20240806200059.GA74866@bhelgaas>
References: <20240806200059.GA74866@bhelgaas>
Date: Thu, 15 Aug 2024 13:20:23 +1000
Message-ID: <87h6bm1ngo.fsf@mail.lhotse>
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

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Sat, Aug 03, 2024 at 12:03:25AM +0530, Amit Machhiwal wrote:
>> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
>> of a PCI device attached to a PCI-bridge causes following kernel Oops on
>> a pseries KVM guest:
>
> What is unique about pseries here?  There's nothing specific to
> pseries in the patch, so I would expect this to be a generic problem
> on any arch.
>
>>  RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>>  Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>>  BUG: Unable to handle kernel data access on read at 0x10ec00000048
>
> Weird address.  I would expect NULL or something.  Where did this
> non-NULL pointer come from?

It originally comes from np->data, which is supposed to be an
of_changeset.

The powerpc code also uses np->data for the struct pci_dn pointer, see
pci_add_device_node_info().

I wonder if that's why it's non-NULL?

Amit, do we have exact steps to reproduce this? I poked around a bit but
couldn't get it to trigger.

cheers

