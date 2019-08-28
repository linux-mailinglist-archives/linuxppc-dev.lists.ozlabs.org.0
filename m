Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 195BFA071A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 18:17:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JW9q1xYdzDqCT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 02:17:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JW7R0mSQzDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 02:15:46 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4527AFE8;
 Wed, 28 Aug 2019 16:15:42 +0000 (UTC)
Date: Wed, 28 Aug 2019 18:15:40 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/4] fs: always build llseek.
Message-ID: <20190828181540.21fa33a4@naga>
In-Reply-To: <20190828151552.GA16855@infradead.org>
References: <cover.1566936688.git.msuchanek@suse.de>
 <80b1955b86fb81e4642881d498068b5a540ef029.1566936688.git.msuchanek@suse.de>
 <20190828151552.GA16855@infradead.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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
Cc: Michael Neuling <mikey@neuling.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, "Dmitry
 V. Levin" <ldv@altlinux.org>, Breno Leitao <leitao@debian.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Firoz Khan <firoz.khan@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Aug 2019 08:15:52 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, Aug 27, 2019 at 10:21:06PM +0200, Michal Suchanek wrote:
> > 64bit !COMPAT does not build because the llseek syscall is in the tables.  
> 
> Well, this will bloat thinkgs like 64-bit RISC-V for no good reason.
> Please introduce a WANT_LSEEK like symbol that ppc64 can select instead.

It also builds when llseek is marked as 32bit only in syscall.tbl

It seems it was handled specially in some way before syscall.tbl was
added, though (removed in ab66dcc76d6ab8fae9d69d149ae38c42605e7fc5)

Thanks

Michal
