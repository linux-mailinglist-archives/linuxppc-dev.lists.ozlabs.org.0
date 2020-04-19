Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09F1AF8B1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 10:18:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494jQ14mdyzDqGb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 18:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494j8n6rnxzDrNR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 18:06:49 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 820AB68BEB; Sun, 19 Apr 2020 10:06:46 +0200 (CEST)
Date: Sun, 19 Apr 2020 10:06:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 8/8] exec: open code copy_string_kernel
Message-ID: <20200419080646.GE12222@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-9-hch@lst.de>
 <ffea91ee-f386-9d19-0bc9-ab59eb7b9a41@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffea91ee-f386-9d19-0bc9-ab59eb7b9a41@c-s.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 18, 2020 at 10:15:42AM +0200, Christophe Leroy wrote:
>
>
> Le 14/04/2020 à 09:01, Christoph Hellwig a écrit :
>> Currently copy_string_kernel is just a wrapper around copy_strings that
>> simplifies the calling conventions and uses set_fs to allow passing a
>> kernel pointer.  But due to the fact the we only need to handle a single
>> kernel argument pointer, the logic can be sigificantly simplified while
>> getting rid of the set_fs.
>
>
> Instead of duplicating almost identical code, can you write a function that 
> takes whether the source is from user or from kernel, then you just do 
> things like:
>
> 	if (from_user)
> 		len = strnlen_user(str, MAX_ARG_STRLEN);
> 	else
> 		len = strnlen(str, MAX_ARG_STRLEN);
>
>
> 	if (from_user)
> 		copy_from_user(kaddr+offset, str, bytes_to_copy);
> 	else
> 		memcpy(kaddr+offset, str, bytes_to_copy);

We'll need two different str variables then with and without __user
annotations to keep type safety.  And introduce a branch-y and unreadable
mess in the exec fast path instead of adding a simple and well understood
function for the kernel case that just deals with the much simpler case
of just copying a single arg vector from a kernel address.
