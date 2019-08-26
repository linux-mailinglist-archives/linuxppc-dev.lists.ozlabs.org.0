Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950D9D947
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 00:37:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HRhC4F83zDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V4Yj/mgK"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HRfD2p5WzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 08:35:16 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w2so12735726pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 15:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZTtLxIEFBiFvvirLNk7rJCpHyKJsG3UuT12vwumOc6c=;
 b=V4Yj/mgKIET0UoJp2BRwZVUfM8V2AmczCU0x1SnvT/ZOx56IgJ9BD2GVGSi/vhq8VT
 fCApXRmB4ctSw9Qja4Kg0K+GcJl8Q6DdxLSq+q61/ftTv9i5CG6gwcSj3xiWeRzQ1qWl
 KifPe7A7QjANncPafKhoJI2VCx5usWEIbMg0ZGE/I7ZdFFUTesd1FXWT2Q07SZVnGF/Y
 1IDGhaTKkYwZyw0MpgLx9S1ru+lG8BGfGNGS/7INVWaXjpxI9Pp2t+OVu436nKa8238G
 oNqZKQK8uVFD/nAamPO86nU17D7TwmRoXDUF53i42+GF5eIES6p9m9cXmSCrdSiQLsco
 z2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZTtLxIEFBiFvvirLNk7rJCpHyKJsG3UuT12vwumOc6c=;
 b=RPACD83dl7I/pifs4DNxtRtXtBJMvlAdnIgMoUlKOTugKb+tMlpec1F4IPutAs3MxH
 UDwPJm3QKmNZulwVYwHsTTMF+2jmR09Ids00VF6AhZa28sTh0EP7YOWuTcu/KAOVib7e
 ZBD3bnbGbqeYhXZ5wxeqYU52mJtynwH+ofoijsKY05y9qmph9gWQxEOCTly7+iIMehF9
 5ps3Y+oIAhoIXkzLnd/YDXGo76r66rmpoejljsTeB8iZehInAaQfBCbWjUVVkWCEFq6x
 AFnY+tdkVQRFjeBJIXR5pBnb4uKhD7IVhVzBSWiFahPK2/ocwlmmcIBRg20XZxYJFwls
 VEOQ==
X-Gm-Message-State: APjAAAXxgd+w2M1Rfy2zFkYk5qKDxk8K8uWVk8jIULqsoTLTsxq/fXNC
 dSeHAhCJB9zi8g8/nX4Sq88=
X-Google-Smtp-Source: APXvYqx9fB2zz3reQwDJm1c/UTcOst3U1UlmTMEEGuwoeB+hHpMqnGwoyiFnFyuGEv6PeBIfrwI1hg==
X-Received: by 2002:a65:62d7:: with SMTP id m23mr18488160pgv.358.1566858912811; 
 Mon, 26 Aug 2019 15:35:12 -0700 (PDT)
Received: from mail.google.com ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id s5sm474687pjo.26.2019.08.26.15.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:35:12 -0700 (PDT)
Date: Tue, 27 Aug 2019 06:35:02 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 05/11] ftrace: create memcache for hash entries
Message-ID: <20190826223501.ymj3g4ftrf5eqhzq@mail.google.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
 <20190825132330.5015-6-changbin.du@gmail.com>
 <20190826074437.GM2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826074437.GM2369@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-mips@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2019 at 09:44:37AM +0200, Peter Zijlstra wrote:
> On Sun, Aug 25, 2019 at 09:23:24PM +0800, Changbin Du wrote:
> > When CONFIG_FTRACE_FUNC_PROTOTYPE is enabled, thousands of
> > ftrace_func_entry instances are created. So create a dedicated
> > memcache to enhance performance.
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  kernel/trace/ftrace.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index a314f0768b2c..cfcb8dad93ea 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -94,6 +94,8 @@ struct ftrace_ops *function_trace_op __read_mostly = &ftrace_list_end;
> >  /* What to set function_trace_op to */
> >  static struct ftrace_ops *set_function_trace_op;
> >  
> > +struct kmem_cache *hash_entry_cache;
> > +
> >  static bool ftrace_pids_enabled(struct ftrace_ops *ops)
> >  {
> >  	struct trace_array *tr;
> > @@ -1169,7 +1171,7 @@ static int add_hash_entry(struct ftrace_hash *hash, unsigned long ip,
> >  {
> >  	struct ftrace_func_entry *entry;
> >  
> > -	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
> > +	entry = kmem_cache_alloc(hash_entry_cache, GFP_KERNEL);
> >  	if (!entry)
> >  		return -ENOMEM;
> >  
> > @@ -6153,6 +6155,15 @@ void __init ftrace_init(void)
> >  	if (ret)
> >  		goto failed;
> >  
> > +	hash_entry_cache = kmem_cache_create("ftrace-hash",
> > +					     sizeof(struct ftrace_func_entry),
> > +					     sizeof(struct ftrace_func_entry),
> > +					     0, NULL);
> > +	if (!hash_entry_cache) {
> > +		pr_err("failed to create ftrace hash entry cache\n");
> > +		goto failed;
> > +	}
> 
> Wait what; you already have then in the binary image, now you're
> allocating extra memory for each of them?
>
No, here we only allocate ftrace hash entries. The prototype data is not copied.
The entry->priv points to prototype data in binary.

> Did you look at what ORC does? Is the binary search really not fast
> enough?
For ftrace, binary search is not enough. Just like the hash tables
(ftrace_graph_notrace_hash, ftrace_graph_hash) we already have which is used to
filter traced functions.


-- 
Cheers,
Changbin Du
