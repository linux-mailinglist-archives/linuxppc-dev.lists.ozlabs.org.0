Return-Path: <linuxppc-dev+bounces-65-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA55950A92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 18:43:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RB98VEtL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjxz91nXXz2xjk;
	Wed, 14 Aug 2024 02:43:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RB98VEtL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjxz90hQPz2xHg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 02:43:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B7ED4CE165A;
	Tue, 13 Aug 2024 16:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76125C4AF0B;
	Tue, 13 Aug 2024 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723567410;
	bh=RiYO5QgCiG46B5wMfDOn91P7Ne0jjaRilLFCxBkm9oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RB98VEtLU+c8RS00jyMQhUzcLUNRfjQcFL8ppmMAYx7tKDn5190sFuXoZR7MdfvMS
	 oeDSx3tEbc+DR0g0nLs6lOTP4XnxO+2RL7bOWSdy5OOIokyWFkDxS57tnksjsUVn4c
	 QKtntpKVqu+crcEu9CXO7J+GNIzqvALTKztHR7st/Gb7hnPFM6QMfAX9qKQKWaQqcn
	 bdXpHGtAlroCMg+r8XtmJBHzfIJyONhKGjQIk6HDdjSqbXjvIEjrLVS4AdZk0cNznh
	 1hQnBO7nLmD2/ZA/Z19C62QQ8II6DjFvsX2/iVLd7sM5khnS4io7v5eNFdAudKMLQ/
	 Q8iC6UexbTsjw==
Date: Tue, 13 Aug 2024 10:43:29 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Vaibhav Jain <vaibhav@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Vaidyanathan Srinivasan <svaidy@linux.ibm.com>,
	Kowshik Jois B S <kowsjois@linux.ibm.com>,
	Lukas Wunner <lukas@wunner.de>, kernel-team@lists.ubuntu.com,
	Stefan Bader <stefan.bader@canonical.com>
Subject: Re: [PATCH v3] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Message-ID: <20240813164329.GA1180569-robh@kernel.org>
References: <20240802183327.1309020-1-amachhiw@linux.ibm.com>
 <20240806200059.GA74866@bhelgaas>
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
In-Reply-To: <20240806200059.GA74866@bhelgaas>

On Tue, Aug 06, 2024 at 03:00:59PM -0500, Bjorn Helgaas wrote:
> On Sat, Aug 03, 2024 at 12:03:25AM +0530, Amit Machhiwal wrote:
> > With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> > of a PCI device attached to a PCI-bridge causes following kernel Oops on
> > a pseries KVM guest:
> 
> What is unique about pseries here?  There's nothing specific to
> pseries in the patch, so I would expect this to be a generic problem
> on any arch.

Only pseries does PCI hotplug with DT I think. It would happen if 
another system did though, but I think documenting the exact system is 
good. No reason we can't do both though.

Rob

