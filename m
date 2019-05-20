Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D8E23B5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:57:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45727T64jWzDqLL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 00:57:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=cz5i=tu=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45725D0rdnzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:55:43 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBB07206BA;
 Mon, 20 May 2019 14:55:40 +0000 (UTC)
Date: Mon, 20 May 2019 10:55:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/4] x86/ftrace: Fix use of flags in
 ftrace_replace_code()
Message-ID: <20190520105538.7f8515d3@gandalf.local.home>
In-Reply-To: <1558363129.y2x8hf9shq.naveen@linux.ibm.com>
References: <cover.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <e1429923d9eda92a3cf5ee9e33c7eacce539781d.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190520091320.01cdcfb7@gandalf.local.home>
 <20190520094410.772443df@gandalf.local.home>
 <1558363129.y2x8hf9shq.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 May 2019 20:12:48 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:


> Thanks, that definitely helps make things clearer. A very small nit from 
> your first patch -- it would be good to also convert the calls to 
> ftrace_check_record() to use 'true' or 'false' for the 'update' field.

Heh, I was so focused on the "enable" part, I did the "update" as a
second thought, and forgot to update the callers. Thanks for pointing
that out.

> 
> I will test my series in more detail and post a v1.

Great.

-- Steve

