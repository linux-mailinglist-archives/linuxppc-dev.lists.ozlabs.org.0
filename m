Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E61EA552
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 15:52:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bGnr6HbSzDq6B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 23:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=mjak=7o=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bGjW6nhWzDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 23:48:47 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB4202068D;
 Mon,  1 Jun 2020 13:48:43 +0000 (UTC)
Date: Mon, 1 Jun 2020 09:48:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v8 2/5] seq_buf: Export seq_buf_printf
Message-ID: <20200601094842.3cd0cab6@gandalf.local.home>
In-Reply-To: <87367f9eqs.fsf@linux.ibm.com>
References: <20200527041244.37821-1-vaibhav@linux.ibm.com>
 <20200527041244.37821-3-vaibhav@linux.ibm.com>
 <87367f9eqs.fsf@linux.ibm.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Christoph Hellwig <hch@infradead.org>, Oliver O'Halloran <oohall@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Jun 2020 17:31:31 +0530
Vaibhav Jain <vaibhav@linux.ibm.com> wrote:

> Hi Christoph and Steven,
> 
> Have addressed your review comment to update the patch description and
> title for this patch. Can you please provide your ack to this patch.
> 
> 

I thought I already did, but it appears it was a reply to a private email
you sent to me. I didn't realize it was off list.

Anyway:

 Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
