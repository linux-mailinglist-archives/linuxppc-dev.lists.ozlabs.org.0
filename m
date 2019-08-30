Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B904EA3A25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 17:14:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KjhK21ZkzDqGc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 01:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kjdf6RqHzDqvj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 01:12:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=redhat.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Kjdf2Xc9z8t7L
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 01:12:38 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Kjdf1zLqz9sML; Sat, 31 Aug 2019 01:12:38 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46Kjdd6Vmdz9sBp
 for <linuxppc-dev@ozlabs.org>; Sat, 31 Aug 2019 01:12:37 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 143BB881346;
 Fri, 30 Aug 2019 15:12:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4492100197A;
 Fri, 30 Aug 2019 15:12:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190830145454.B91DF125411@zmta02.collab.prod.int.phx2.redhat.com>
References: <20190830145454.B91DF125411@zmta02.collab.prod.int.phx2.redhat.com>
 <20190830085646.14740-1-hdanton@sina.com>
 <4384.1567174383@warthog.procyon.org.uk>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042 from
 LTP
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11907.1567177954.1@warthog.procyon.org.uk>
Date: Fri, 30 Aug 2019 16:12:34 +0100
Message-ID: <11908.1567177954@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 30 Aug 2019 15:12:36 +0000 (UTC)
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
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hillf Danton <hdanton@sina.com> wrote:

> 1, callee has no pre defined duty to help caller in general; they should not
> try to do anything, however, to help their callers in principle due to
> limited info on their hands IMO.

Ah, no.  It's entirely reasonable for an API to specify that one of its
methods will be called with one or more locks held - and that the method must
be aware of this and may make use of this.

> 3, no comment can be found in security/keys/request_key_auth.c about
> the rcu already documented.

There is API documentation in Documentation/security/keys/core.rst.  If you
look at about line 1538 onwards:

  *  ``void (*describe)(const struct key *key, struct seq_file *p);``

     This method is optional. It is called during /proc/keys reading to
     summarise a key's description and payload in text form.

     This method will be called with the RCU read lock held. rcu_dereference()
     should be used to read the payload pointer if the payload is to be
     accessed. key->datalen cannot be trusted to stay consistent with the
     contents of the payload.

     The description will not change, though the key's state may.

     It is not safe to sleep in this method; the RCU read lock is held by the
     caller.

David
