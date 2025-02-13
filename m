Return-Path: <linuxppc-dev+bounces-6158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B492A350DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 23:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv8P709LFz302D;
	Fri, 14 Feb 2025 09:04:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739484298;
	cv=none; b=oiCNIKrJb3pI8DHEHH/RMK7Jd+/w9jMpFLsWfZAPZAqUaeDsYT+e/k7ahtrb9sHJryoSfhnbIz7PSCNn5jkFMNW9FUMwgh6ovNZwLpjFEle6/4DdbeWTUtHB+GlzLVNa7f9ISy4dYToIZ9DPYld6itamb/yb2FlXYKrycOakJ5+QxoZLivU7Uesxm/hCJDEQFM7fJJZpZyn0P5RZF8LFqnxW2fb/qLGuT/PHD4zsIcVISmX8Yo9AG/Lj/Xm2sZfVSQT/xI+dLArkntY6M/DOWP/PGD0dAfvVUsJ4uJFiVy96/Wmq/Az0HJN0F8QpX4U1l+OIgDSnrsk+MEw9/wEtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739484298; c=relaxed/relaxed;
	bh=v+qE3P9xh8OokJLUxy2XYJfq8LD2WVNFiQg+lJ9L/1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FPKBrRQzYWx7bA9MWfhlEYvL6IMHAkW5vY19oJirT6TlRIf+yTeTIrBcvhdU9karBUknFyBDtSto0mDQewE0KMfE2LAXR4IYgZw4GQWd0MvmKWjne+LTns8nJIk1m+95NG59QaZGUOcvUAolWuZ6EEOfTA6BVEdR9Yto1xCb9cjTcUeaNRP1FJ6h2FLDXzhTjZO0w1dlCFb+vlImrv7OmvZfFGNdtj5nt1Xi68t8A6a0Y+lYYisxXMmp4g5UJzesN6xSv2LsyB4Oc+xdgi4ShGwz5SWaLRYmnG8hsw3aMAjDx+VuM19nS26IIi4tCOg99vAo+MnucWJrCoHgWR8TbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=talKcyaI; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=talKcyaI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv8P61XB6z301x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 09:04:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32FBAA420FE;
	Thu, 13 Feb 2025 22:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA989C4CED1;
	Thu, 13 Feb 2025 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739484295;
	bh=1/WveDm/ekbxB+e2hgWNoswGMfH9BEp6P/yKiJf4W30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=talKcyaIhuIqjTNEjZE/LJL4lAacjN+SrWguhvlv7aYxpZiEg2znEHLgZvJygvpFk
	 iaNUgjNYGHyxc1HYl3ewtpvlmNDrHmYlwCqZFXytRQVgxtDPXlHqX5g74W1MzH3PTX
	 7xNaQCHaSbgPzLovB0fjp/MByTd/XiDzkYBTY6DPh7TdIDmkVz7YL/hRIzOqt7kEnG
	 Ae6TjTTO0rnZpJE9GK2HYgAKwyf9Wd9hH9bCbWvfAirWeZSRXa1msSZdXCk9TeBmT5
	 CC4NbHkEb2TqpwY1f8kWK/QLNnToTzUqKGgASD1ZWBEI9AS33rk9N3SXE3cPXIzrpt
	 PpfdHG9z+E+jg==
Date: Thu, 13 Feb 2025 16:04:53 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH 3/4] PCI: shpchp: Cleanup logging and debug wrappers
Message-ID: <20250213220453.GA135512@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216161012.1774-4-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 16, 2024 at 06:10:11PM +0200, Ilpo Järvinen wrote:
> The shpchp hotplug driver defines logging wrappers ctrl_*() and another
> set of wrappers with generic names which are just duplicates of
> existing generic printk() wrappers. Only the former are useful to
> preserve as they handle the controller dereferencing (the latter are
> also unused).
> 
> The "shpchp_debug" module parameter is used to enable debug logging.
> The generic ability to turn on/off debug prints dynamically covers this
> usecase already so there is no need to module specific debug handling.
> The ctrl_dbg() wrapper also uses a low-level pci_printk() despite
> always using KERN_DEBUG level.

I think it's great to get rid of the module param.  Can you include
a hint about how users of shpchp_debug should now enable debug prints?

The one I have in my notes is to set CONFIG_DYNAMIC_DEBUG=y and boot
with 'dyndbg="file drivers/pci/* +p"'.

> Convert ctrl_dbg() to use the pci_dbg() and remove "shpchp_debug" check
> from it.
> 
> Removing the non-ctrl variants of logging wrappers and "shpchp_debug"
> module parameter as they are no longer used.

> -#define dbg(format, arg...)						\
> -do {									\
> -	if (shpchp_debug)						\
> -		printk(KERN_DEBUG "%s: " format, MY_NAME, ## arg);	\
> -} while (0)
> -#define err(format, arg...)						\
> -	printk(KERN_ERR "%s: " format, MY_NAME, ## arg)
> -#define info(format, arg...)						\
> -	printk(KERN_INFO "%s: " format, MY_NAME, ## arg)
> -#define warn(format, arg...)						\
> -	printk(KERN_WARNING "%s: " format, MY_NAME, ## arg)

The above are unused, aren't they?  Can we make a separate patch to
remove these, for ease of describing and reviewing?

Bjorn

