Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466725AB41
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:39:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhNmc1vqKzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 22:39:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhNjd4KcpzDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 22:36:52 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C9AC368B02; Wed,  2 Sep 2020 14:36:46 +0200 (CEST)
Date: Wed, 2 Sep 2020 14:36:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 10/10] powerpc: remove address space overrides using
 set_fs()
Message-ID: <20200902123646.GA31184@lst.de>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-11-hch@lst.de>
 <8974838a-a0b1-1806-4a3a-e983deda67ca@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8974838a-a0b1-1806-4a3a-e983deda67ca@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 02, 2020 at 08:15:12AM +0200, Christophe Leroy wrote:
>> -		return 0;
>> -	return (size == 0 || size - 1 <= seg.seg - addr);
>> +	if (addr >= TASK_SIZE_MAX)
>> +		return false;
>> +	if (size == 0)
>> +		return false;
>
> __access_ok() was returning true when size == 0 up to now. Any reason to 
> return false now ?

No, this is accidental and broken.  Can you re-run your benchmark with
this fixed?
