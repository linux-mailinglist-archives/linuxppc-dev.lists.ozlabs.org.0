Return-Path: <linuxppc-dev+bounces-3815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFC9E511A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 10:20:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3plc6qk7z2yK7;
	Thu,  5 Dec 2024 20:20:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733390444;
	cv=none; b=ab3iDMR9R7w8a9IpJ0T95ACPQO5EJ3Elwll/JVcrdTVkGHQhp9C3KvAwXpfW8DHEJPES9hlPLzPeddn7fhaAoIGXgmUKeFKI1gcLULX22vS5F4tQ7hpn5mGO7w0h+28HeIW5K3EW7avP0Sbzrrg8MArJCoCEa0L8ry/6AWJc9fg9TAN7B33O3AzDg4xSejuSYAiBQ96u9aoOp93xlNskl4uVlbcHCep90h42HUZJ4wtAoNXu8RO4F/5aTzS0knErgRzfRtRjQMkT38Ep5QnWkGgXc2EojNyawagn1zKVLCByT2yRbZna1AbASsX7OVRzN64UUbuJM9soqhlg5Wihfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733390444; c=relaxed/relaxed;
	bh=mJd+LcZRky6I65akfu/kscTitlhBM7Z2lQwstDlwviM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHi99PiwjjRgjtp+WaEX2lanyJAHpEwRliuOnZ6I4dAmfX/IMSAmB3NYQiQUrgBmciiTbgEi9EfE2g9MR8UNasN4exgmYbRqnNRbvt6CL0EuizRVeQh+78ZBWxAO/IJe/1Lv4quREDHvui6/0aL7VQfmj8K1UiurFl0YFTobuwK3ua/xIcxxFIUU0S4gvAg4W1nIJJCxacLfOVr+yK8X5bRGpYtYFrIxWYwoY609PAxgz5y8JPJY9BjWROFky+5UM2TLdKHYI5ePCYW8L9zQP/+kCKJeSl63ArPQ7ea6HDCL4VM3PmWZax14Zg+NAURHejEd8/bE+WriKKNxQkGL1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eyjoR7Hv; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eyjoR7Hv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3plY4kGjz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 20:20:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F4875C722E;
	Thu,  5 Dec 2024 09:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC96AC4CED1;
	Thu,  5 Dec 2024 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390438;
	bh=QjLPaoFnOl8nQT0shBLP2oEUk6t3cO+Cr9MiwxrNv90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyjoR7Hvl58VxupQPMKipr4q/IRsG8OVhqhhDLhHOzE3PPmRHst2FDPTTYBPyHxuK
	 9YPu9FHKegN1u3QsVfQON/ctQlWbl20Ax/DtT6KBgsvaiqDbdgszm2m8tkmQvxp/j6
	 KttXSDrjW8lXJXusvIx0Z1eN51OoVMusSh8IXWnOmajNfnZaiHfqoWztzb37E7Wqfv
	 F2iY+V6PBxFNpywM9ba5jqmoFCsCVFYASHJvk0QLe++6Chglo09h5/ETr0sBMnMQ8m
	 YAQxGoH+qdMK1tfct7nTzvcxtevJ/DPYHwXPFAnVQF0ZpOYZ41OIgwst1LzyRqelMd
	 l88ABA/G7o2cA==
Date: Thu, 5 Dec 2024 09:20:33 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/5] sysfs: add macro BIN_ATTR_ADMIN_WO()
Message-ID: <Z1FwYQFCK_eRkcRD@google.com>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
 <20241202-sysfs-const-bin_attr-admin_wo-v1-1-f489116210bf@weissschuh.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-1-f489116210bf@weissschuh.net>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 08:00:36PM +0100, Thomas Weiﬂschuh wrote:
> The macros BIN_ATTR_RO/BIN_ATTR_WO/BIN_ATTR_WR and
> BIN_ATTR_ADMIN_RO/BIN_ATTR_ADMIN_RW already exist.
> To complete the collection also add BIN_ATTR_ADMIN_WO.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

