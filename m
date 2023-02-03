Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D768A203
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 19:27:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7kfh4n7lz3f6y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 05:27:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ibou1Av0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ibou1Av0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7kdp1BNXz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 05:27:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4B5D61F51;
	Fri,  3 Feb 2023 18:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962ACC433D2;
	Fri,  3 Feb 2023 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675448826;
	bh=/gGZ9DwGLZg6jeLZ/Wca9dGvDkPShPONk1yE/DS5X2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ibou1Av0ziWyc38GTlFFW39X3zPS+WgBGY9WIaLThXolJ3efOkr1EZJyJrLrfw1xT
	 tPsjJ/HXBfiaQcE1GBWhcrL8Rl1gsTqdryBHtoKSWn4o/Ol4cTUff2ZSDvxDx37Q4z
	 ZvpU1Bp1cXCImIzgi1toeJwkkesVNjWXqL4x9qHsDlAQFwI05qkVMLiTIpLW2zXEzN
	 8tLSKve7+4BAMp3k+ovNYkyjt/5/ZBXsIcV6zS+u2yYXoCvmhVeR2+vYS4nL2Yc5Fv
	 rkrNOFcSc1NWGPXwfQLQ2FDwTw/eESW8T4AM5WzPYH3ePz61OZdqYDnz8DqCcHB6vS
	 9JJBRxDMSQS+w==
Date: Fri, 3 Feb 2023 10:27:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
Message-ID: <20230203102704.66f6b59a@kernel.org>
In-Reply-To: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, npiggin@gmail.com, linux-serial@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  1 Feb 2023 22:36:19 +0800 Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> bus_type::remove be void-returned, it doesn't make much sense for any
> bus based driver implementing remove callbalk to return non-void to
> its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>

Acked-by: Jakub Kicinski <kuba@kernel.org>
