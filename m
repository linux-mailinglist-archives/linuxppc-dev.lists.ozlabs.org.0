Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F00C2DF1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 09:41:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jB6f44N7zDqRG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 17:41:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="cyPOfDGM"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jB4G0RnfzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 17:39:41 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id BB5987EC07;
 Tue,  1 Oct 2019 02:39:37 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1569915578; bh=VQh4VMtvPcD76Ubv0XIxwV4WJkxQWIK/yvw0SNifRtA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cyPOfDGMASmLbYq62mK5tqDVfbL80DfM5OgUiAqX4bzF47Nas/Xj83V40A6PpfG7g
 CA/KtXy2JHetwKfHetW4h4x1tICZeFTfVLV/+90cOMX54ZvY78CDoXSeHW1/i/9zzX
 CwZoMXG9tjykfvL/AzSYoBFcyCCh+zm85e50I10Mp5ajq8FVgNDHC5AexwkQjVEiqB
 CoCaPDtqh+GhqelrIDMncsM48wQCFKsC4SeoAWl8G6CHu7iAjdElPkjUtIqi0RegHY
 Rz8ulaSroUdjGMfAHtEu377eTTklDHo3PdXae5A85T+EncFZSWxVHFWCx4zFsplnWp
 /MNumFzdmtMyQ==
Subject: Re: IOMMU group creation for pseries hotplug, and powernv VFs
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190930020848.25767-1-oohall@gmail.com>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <de325701-e77c-8058-64fa-87ff4092c83f@anastas.io>
Date: Tue, 1 Oct 2019 02:39:37 -0500
MIME-Version: 1.0
In-Reply-To: <20190930020848.25767-1-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/29/19 9:08 PM, Oliver O'Halloran wrote:
> A couple of extra patches on top of Shawn's existing re-ordering patch.
> This seems to fix the problem Alexey noted with Shawn's change causing
> VFs to lose their IOMMU group. I've tried pretty hard to make this a
> minimal fix it's still a bit large.
> 
> If mpe is happy to take this as a fix for 5.4 then I'll leave it,
> otherwise we might want to look at different approaches.
> 

Thanks for fixing this Oliver!

Reviewed-by: Shawn Anastasio <shawn@anastas.io>
