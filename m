Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B36A545E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 09:29:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQrBw0GtMz3cJn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 19:29:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jxDYNaWl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jxDYNaWl;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQr9x2BXJz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 19:28:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB085B80D3B;
	Tue, 28 Feb 2023 08:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617C4C433EF;
	Tue, 28 Feb 2023 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677572926;
	bh=kKR2VXV5T7q7vyn3FE2qodUASqy7x3m1sm3A5wpu7zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxDYNaWlH5B6CqDuz01DyfgUH2B+8Htm9Olu3aGt/zKyq1CTFvvtA6GDgq4sjy7ts
	 WixYZF6bMWE5331kIouN0dWJMfh5yb+iATBTaK7c0Sb7szETF73ytq7XMKTOAgy8gx
	 JYDYyYrOuoX7XBjZN/DWcQzO3y95BpdD3oYd0LUM=
Date: Tue, 28 Feb 2023 09:28:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?546L5piK54S2?= <msl0000023508@gmail.com>
Subject: Re: Symbol cpu_feature_keys should be exported to all modules on
 powerpc
Message-ID: <Y/27PBzfeRNEhWnA@kroah.com>
References: <CAPge7ycxEpms_wQoDoCncz743N2BfzVCZPLmbHCVTs6ZKSp=nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPge7ycxEpms_wQoDoCncz743N2BfzVCZPLmbHCVTs6ZKSp=nA@mail.gmail.com>
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
Cc: Kevin Hao <haokexin@gmail.com>, stable@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 28, 2023 at 04:18:12PM +0800, 王昊然 wrote:
> Just like symbol 'mmu_feature_keys'[1], 'cpu_feature_keys' was referenced
> indirectly by many inline functions; any GPL-incompatible modules using such
> a function will be potentially broken due to 'cpu_feature_keys' being
> exported as GPL-only.
> 
> For example it still breaks ZFS, see
> https://github.com/openzfs/zfs/issues/14545
> 
> [1]: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220329085709.4132729-1-haokexin@gmail.com/

External modules are always on their own, sorry.  Especially ones that
are not released under the GPL.

good luck!

greg k-h
