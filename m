Return-Path: <linuxppc-dev+bounces-4652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0598AA00D08
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 18:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPrYg3c83z30Vr;
	Sat,  4 Jan 2025 04:44:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735926279;
	cv=none; b=lqpmkz88brXnPWEWiJyxiDWhherIkTne7dtwg0i9htcQG1losQy7yFnzlD9nUBqunFHS/yHdEEYMtw0XSjlvrBbN07bW4bRWM1NW0+WtUjLiDtT2RxzX8O+wa8S+y3nq+k+Dz8D+XQk2FBy6VbikCXUYKLnEyU8Uomx354VyLydpJID1BgQ3+HoTWJrQeOoCmkUFjE/oEp+y3eeNgLm9wRoAg18xN++LJeUyJNKhKo8dJR2pTrlaYvhxHA/S7/TnfLiosQQ09vW0ZNjkr1aOQU4QO9iWi2zeRkDhOibh7TOzEOejtoHUzz3XYZ3aTviTWHyKBb33nkm46DdGvO1JDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735926279; c=relaxed/relaxed;
	bh=qCyahOV2kTIZy40KZRDCk8UlhlNMc75kM0yqojqk1/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m5MVlBE7QFP9EUnaHP6LKZZXr3gzkBKLlIQxAClq64NIOZB7P/tupE8h3ZAmdo8Y0GZ8zxS5kRStUYKtzkaBk9JtOs0OooUBUgc9Z3MzcILYigjp6kIZirk7EY5RutVcLT8TfLzfu3CqGYzVMY+vRwFjjGlLsdX+u1O/A9SjjE2wn7oXpR03mT3hYomzHLPVJfdMjyE/jwfhyb4tNjKqE/31WjjgtZPjKU7F7MExby/CUrLGw+x/bhBWsFEVIglmZq3xdn+wl5DQSX0J8yGoZakv3/K1oIVoPSaSX5x5ZQhdYMz0iqSJK+q490/ws1PywZ9rfSBJp8OC7xL1uA4UFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=meOuPxmX; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=meOuPxmX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPrYf0Kqxz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 04:44:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95ABDA41034;
	Fri,  3 Jan 2025 17:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02697C4CED6;
	Fri,  3 Jan 2025 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735926275;
	bh=pRVkikpR9atkH7Z9yyBq4g6p9KSycIkZ3xWUYDx7kKA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=meOuPxmX/Ck1O9Y0poyu1vIfbHYu57927aYMHr4c+lFo4un3h0FURP6ahYknhqadI
	 Ou3VE5lCVqinSr+c8Ca+iIDQm550srFu7W26FsUMWJpjdA4+n8mRM7dLEHg8xSPaqP
	 8uEmFVTOnt42FDy6XzozpeQulJLK6F/LapjtG2jjw8z40p+fYAO1Uk1d0RJiOIMAsw
	 HeBZrvMlEAV40/iwAhBNNadnacwoWmNvPaRMbqDe+q0Bwsqm2/Cf4pkwB2e5Vu/oPS
	 Rz/a4yLi/ZewxdQd392AAm4dRgoMDQuSPqZW2Fis9fDjNtXPetd2B+BiXacAoGTxrz
	 HeQV+3vysqs6g==
Date: Fri, 3 Jan 2025 11:44:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH 06/14] cpumask: re-introduce cpumask_next{,_and}_wrap()
Message-ID: <20250103174432.GA4182129@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228184949.31582-7-yury.norov@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Dec 28, 2024 at 10:49:38AM -0800, Yury Norov wrote:
> cpumask_next_wrap_old() has two additional parameters, comparing to it's
> analogue in linux/find.h find_next_bit_wrap(). The reason for that is
> historical.

s/it's/its/

Personally I think cscope/tags/git grep make "find_next_bit_wrap()"
enough even without mentioning "linux/find.h".

> + * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
> + *			   @n and wrapping around, if needed
> + * @n: the cpu prior to the place to search (i.e. return will be > @n)

Is the return really > @n if it wraps?

