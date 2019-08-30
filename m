Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9E9A3901
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 16:18:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KhQl6GzQzDqgG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 00:18:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KhK21Wq4zDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 00:13:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=redhat.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46KhK02dCZz8vq5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 00:13:08 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46KhJz61TVz9sN4; Sat, 31 Aug 2019 00:13:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=dhowells@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46KhJz2bT0z9sBp
 for <linuxppc-dev@ozlabs.org>; Sat, 31 Aug 2019 00:13:07 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 617ED308620B;
 Fri, 30 Aug 2019 14:13:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 125E11001925;
 Fri, 30 Aug 2019 14:13:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190830085646.14740-1-hdanton@sina.com>
References: <20190830085646.14740-1-hdanton@sina.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042 from
 LTP
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4383.1567174383.1@warthog.procyon.org.uk>
Date: Fri, 30 Aug 2019 15:13:03 +0100
Message-ID: <4384.1567174383@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 30 Aug 2019 14:13:05 +0000 (UTC)
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
Cc: dhowells@redhat.com, Sachin Sant <sachinp@linux.vnet.ibm.com>,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hillf Danton <hdanton@sina.com> wrote:

> -	struct request_key_auth *rka = dereference_key_rcu(key);
> +	struct request_key_auth *rka;
> +
> +	rcu_read_lock();
> +	rka = dereference_key_rcu(key);

This shouldn't help as the caller, proc_keys_show(), is holding the RCU read
lock across the call.  The end of the function reads:

		if (key->type->describe)
			key->type->describe(key, m);
		seq_putc(m, '\n');

		rcu_read_unlock();
		return 0;
	}

and the documentation says "This method will be called with the RCU read lock
held".

I suspect the actual bugfix is this bit:

> +	if (!rka)
> +		goto out;

David
