Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1264AF31A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 14:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv1K059YLz3cQc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 00:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=www18.qth.com (client-ip=69.16.238.59; helo=www18.qth.com;
 envelope-from=davidtg+robot@justpickone.org; receiver=<UNKNOWN>)
Received: from www18.qth.com (www18.qth.com [69.16.238.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv1JX34Gyz2yfc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 00:42:00 +1100 (AEDT)
Received: from [73.207.192.158] (port=49618 helo=justpickone.org)
 by www18.qth.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <davidtg+robot@justpickone.org>)
 id 1nHnEH-0007oL-Sg; Wed, 09 Feb 2022 07:41:53 -0600
Date: Wed, 9 Feb 2022 08:41:39 -0500
From: David T-G <davidtg+robot@justpickone.org>
To: linux-raid@vger.kernel.org
Subject: Re: [PATCH v2 1/2] lib/raid6/test/Makefile: Use `$(pound)` instead
 of `\#` for Make 4.3
Message-ID: <20220209134139.GA4455@justpickone.org>
References: <20220208152148.48534-1-pmenzel@molgen.mpg.de>
 <d07a9d41-5a8f-a1f3-59f7-d2a75d6df2e5@youngman.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d07a9d41-5a8f-a1f3-59f7-d2a75d6df2e5@youngman.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - www18.qth.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - justpickone.org
X-Get-Message-Sender-Via: www18.qth.com: authenticated_id:
 dmail@justpickone.org
X-Authenticated-Sender: www18.qth.com: dmail@justpickone.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul, et al --

...and then Wols Lists said...
% 
% On 08/02/2022 15:21, Paul Menzel wrote:
...
% 
% As commented elsewhere, for the sake of us ENGLISH speakers,
% *PLEASE* make that $(hash). A pound sign is £.

Or, even better, $(octothorpe) since that's merely a symbol rather than a
food product or a result of an algorithm on data.  You might even hope
that we hash this out eventually ...


Have a great day!

:-D
-- 
David T-G
See http://justpickone.org/davidtg/email/
See http://justpickone.org/davidtg/tofu.txt

