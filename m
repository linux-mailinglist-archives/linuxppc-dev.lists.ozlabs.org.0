Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDAD2F8484
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:33:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVFH0B3szDvW8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:33:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iW5vxKMW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHS5H0m18zDsbR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:56:50 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7979C20738;
 Fri, 15 Jan 2021 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610729807;
 bh=65KME7dlQ6ZxSIcs/tBhxcihrYV+4nzB/aZGW3JS39U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iW5vxKMW9vNDJos4it09xTOONBPZKklsLnEyxEmE4xEDwArUAAIjUc6JNJFqx7Ijw
 DyGUNyWEQI19X/6El61kkAvRhz4DXcIaGio0nqsD8aSOld7nU8cL2WOHM817fNloUF
 bRJsslHS7zn51K8eZee/SERyxtjaG9PT8mU/+Iz6VtMcwkYZgkiVusJE1xYp8IpK3c
 Y7pJgKlcI/1XyLYRlU4875q9xrd8YpE2GDuJM3JPykPxcZ+5gKYBq/0Zl5nJ/pZvRr
 7iH+PfMh+QvJHiDK9j99EYhdStd2dpM7vx3ND4d8ntZqm8bBB7rXitiWgoecnzTKQk
 oBFQNYyCMINqA==
Date: Fri, 15 Jan 2021 08:56:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210115085645.0f27864a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210115133848.GK3975472@dell>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
 <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210114083349.GI3975472@dell>
 <20210114091453.30177d20@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210114195422.GB3975472@dell> <20210115111823.GH3975472@dell>
 <bc775cc3-fda3-0280-5f92-53058996f02f@csgroup.eu>
 <20210115133848.GK3975472@dell>
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
Cc: Paul Durrant <paul@xen.org>, Kurt Kanzenbach <kurt@linutronix.de>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 Peter Cammaert <pc@denkart.be>, Paul Mackerras <paulus@samba.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Utz Bacher <utz.bacher@de.ibm.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Santiago Leon <santi_leon@yahoo.com>, xen-devel@lists.xenproject.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Daris A Nevil <dnevil@snmc.com>,
 Lijun Pan <ljp@linux.ibm.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erik Stahlman <erik@vt.edu>, John Allen <jallen@linux.vnet.ibm.com>,
 Dany Madden <drt@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Russell King <rmk@arm.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Jan 2021 13:38:48 +0000 Lee Jones wrote:
> Okay, so what would you like me to do?  Would you like me to re-submit
> the set based only on net-next

Yes, rebase your patches on net-next, recheck everything builds okay
and resubmit. You should always develop against the tree that will
merge your patches. I appreciate for your janitorial work using
linux-next is more expedient, but as you can see it causes trouble,
this is not the first time your patches don't apply to net-next IIRC.
