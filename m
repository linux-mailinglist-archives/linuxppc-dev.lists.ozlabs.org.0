Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BD430A06
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 17:27:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXP5j1dhlz3c7v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 02:27:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=C4UNljiR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=C4UNljiR; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXP4x2DQZz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 02:27:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=70ZKfllBjZHQa1J4GUObwLCze3CU8wCeQiJAaBSPZwY=; b=C4UNljiRQnxqpGr/gZae9CnIWT
 j7Uyl2yYks8L0q03i4Yj6wzbXHZfLRSnndsp7bwE+G+8kSeY6JWp3qOqYzPXZm7xgouB3Y3hUQhtB
 Pk4Hz6DQ4fJj9JpSQmWL3lPFrfCQD6hkq6x6Rwnt4SbkGg8suXrp9MdS/9GwqmQ6jlHlFEgk2ZXtF
 TIxTzVAunQ+vPdosDdlLDCl2JNMPGbY3ukZHFD5HB/10NLbW6nDO6fT48v5VJRLhpzgc3wB6XGEom
 dyYnzfPdzBD/IPULfN37GdDBH1ku04zKJuWqNo9uyCNES4imNkH0NlqGgJMRJ5knyNRf5ELnaJOvh
 Cfc6kr6w==;
Received: from [2602:306:c5a2:a380:b27b:25ff:fe2c:51a8]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mc83d-00ANfc-5J; Sun, 17 Oct 2021 15:26:41 +0000
Subject: Re: [PATCH 00/13] block: add_disk() error handling stragglers
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, minchan@kernel.org, ngupta@vflare.org,
 senozhatsky@chromium.org, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, kbusch@kernel.org, hch@lst.de,
 sagi@grimberg.me
References: <20211015235219.2191207-1-mcgrof@kernel.org>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <a31970d6-8631-9d9d-a36f-8f4fcebfb1e6@infradead.org>
Date: Sun, 17 Oct 2021 08:26:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015235219.2191207-1-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8
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
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Luis,

On 10/15/21 4:52 PM, Luis Chamberlain wrote:
> This patch set consists of al the straggler drivers for which we have
> have no patch reviews done for yet. I'd like to ask for folks to please
> consider chiming in, specially if you're the maintainer for the driver.
> Additionally if you can specify if you'll take the patch in yourself or
> if you want Jens to take it, that'd be great too.

Do you have a git repo with the patch set applied that I can use to test with?

Thanks.

-Geoff
