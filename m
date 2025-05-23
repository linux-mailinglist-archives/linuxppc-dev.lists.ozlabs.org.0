Return-Path: <linuxppc-dev+bounces-8921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7BBAC2742
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 18:12:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3qv51khBz3050;
	Sat, 24 May 2025 02:12:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748016769;
	cv=none; b=fj+BUzV3lHHRlesbB/POxwdTHbQkquQXfZyToWARN2bPDcS+J0qSNKNYBf5zB10PqsRbqSYRLBq5V4bOvrfW7C6yji38zWGjEuNI5ayaI5fdhBY9SxlblKwlhCyGa2b2Q0hB0apUdXWNPqvFPWA77uQrwPHTa/PvBj2akrQSdkTtwLPX8m10tV0BCsUZlggmPX1jyMztr3D8Q8U2nJFBvbtJO+4xwcHVaNlQIO/NJ6ilNffGGkMUMnml1SVO9VoA17EPJwom0Ty1uYR5GS5VLl5vJS1tZRmgPt5Xg0yJlB5FmhZ4jUY8nddddDKtE2MYD8JQB2MXxgeExtaL1m0blw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748016769; c=relaxed/relaxed;
	bh=IvtURpMUY5h3t3tj+fX5zSWIXfSAK4JyK+oNMkK+R7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fGvekO2wY1V7Xn49CzwqFrCEpoFc5kqC1sFSmhktZNMWqM2j0S5CXaA4t8+dH7IVsy21uHoluJ1l1y3kCH04PgukieYuuzJxUnMVtX0TUd85d8fAMBJvABuDd6TJycM9W1UJD7lvQKODkwodrsSucKQlsidvIkmMqNu52UWm0BjnMCaM5OCrdFRfDSE2yq8BIa2H1gSf/fnUFdYGTQq8mzGBIFntkUJRrx05oQKvqJClSIwzlByQ4ufWuXnk1gvSGJ0lGScLu74WE5ye31bnA9FbBRuDE7hRdOX9t93jlHntok9NlTPJy5PV7oKy+slXyB4ZpE3naV5FpahrSe2dLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gLMKIQgl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gLMKIQgl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3qv43zqVz303B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 May 2025 02:12:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4DA4A4F8FB;
	Fri, 23 May 2025 16:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA36C4CEE9;
	Fri, 23 May 2025 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748016765;
	bh=stvsu4xByc6n2n97XoQi+HIP09rpdP6ynB7YbbNj4KI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gLMKIQglZVHVJrIBT9fuUVoEk86gspRrdu0MSmpWv4I37u4mbh7bM8U2FW2ASJWm0
	 HlIOeJvO4pZYGWJuJTnHz2PDV8OA/gJTLwYNKILEdQlX+bk5xR1FEJyNmY0EA6VKH4
	 HCQNhmtcMFAyGAN5/ymkOF+c94t0ZjngYAfYSCF6GmhvElNxa5t5IH8hmvHXlIlJ4m
	 TPsZdJYlCtR2X3tZL3w8BkiBiwBaeNbrUZSwFNNTtyHlYQ/7iZieQLMwdw6+IOg2CL
	 xSA8Jnjrim//zklWRD/FijrAmNqWRBlJbsq9QFcfyZ9qpt5aYozEULjAbgbSxzXBx7
	 WPrGOeLcX/jfw==
Date: Fri, 23 May 2025 11:12:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v8 16/20] PCI/AER: Convert aer_get_device_error_info(),
 aer_print_error() to index
Message-ID: <20250523161243.GA1559290@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e7a308-713f-d89b-cccd-8f397e097bae@linux.intel.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 23, 2025 at 02:13:52PM +0300, Ilpo Järvinen wrote:
> On Thu, 22 May 2025, Bjorn Helgaas wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Previously aer_get_device_error_info() and aer_print_error() took a pointer
> > to struct aer_err_info and a pointer to a pci_dev.  Typically the pci_dev
> > was one of the elements of the aer_err_info.dev[] array (DPC was an
> > exception, where the dev[] array was unused).

> > -void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> > +void aer_print_error(struct aer_err_info *info, int i)
> >  {
> > -	int layer, agent;
> > -	int id = pci_dev_id(dev);
> > +	struct pci_dev *dev;
> > +	int layer, agent, id;
> >  	const char *level = info->level;
> >  
> > +	if (i >= AER_MAX_MULTI_ERR_DEVICES)
> > +		return;
> 
> Are these OoB checks actually indication of a logic error in the caller 
> side which would perhaps warrant using
> 	if (WARN_ON_ONCE(i >= AER_MAX_MULTI_ERR_DEVICES))
> ?

Good idea, thanks!  I hope we can someday get rid of this info->dev[]
array and the headaches associated with it.

