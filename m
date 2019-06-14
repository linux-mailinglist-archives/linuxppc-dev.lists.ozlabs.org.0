Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5518246B3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 22:46:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QXhR4B9TzDrqd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 06:46:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwn.net
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QXfL0hKVzDrbx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 06:44:41 +1000 (AEST)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A74AE740;
 Fri, 14 Jun 2019 20:44:39 +0000 (UTC)
Date: Fri, 14 Jun 2019 14:44:38 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Bhupesh Sharma <bhsharma@redhat.com>
Subject: Re: [RESEND PATCH] Documentation/stackprotector: powerpc supports
 stack protector
Message-ID: <20190614144438.211b4dd0@lwn.net>
In-Reply-To: <1560161019-3895-1-git-send-email-bhsharma@redhat.com>
References: <1560161019-3895-1-git-send-email-bhsharma@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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
Cc: arnd@arndb.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, bhupesh.linux@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Jun 2019 15:33:39 +0530
Bhupesh Sharma <bhsharma@redhat.com> wrote:

> powerpc architecture (both 64-bit and 32-bit) supports stack protector
> mechanism since some time now [see commit 06ec27aea9fc ("powerpc/64:
> add stack protector support")].
> 
> Update stackprotector arch support documentation to reflect the same.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
> ---
> Resend, this time Cc'ing Jonathan and doc-list.

Applied, thanks.

jon
