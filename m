Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D397449D412
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 22:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkbpF5hQHz3cPY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:05:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=www18.qth.com (client-ip=69.16.238.59; helo=www18.qth.com;
 envelope-from=davidtg+robot@justpickone.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1346 seconds by postgrey-1.36 at boromir;
 Thu, 27 Jan 2022 02:01:03 AEDT
Received: from www18.qth.com (www18.qth.com [69.16.238.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkRk73qzdz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 02:00:58 +1100 (AEDT)
Received: from [73.207.192.158] (port=36496 helo=justpickone.org)
 by www18.qth.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <davidtg+robot@justpickone.org>)
 id 1nCjRO-0001U6-JN; Wed, 26 Jan 2022 08:38:29 -0600
Date: Wed, 26 Jan 2022 09:38:27 -0500
From: David T-G <davidtg+robot@justpickone.org>
To: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>
Subject: Re: a pound's a pound the whole world 'round (was "Re: [PATCH 1/3]
 ... Use `$(pound)` instead ...")
Message-ID: <20220126143827.GF14596@justpickone.org>
References: <20220126114144.370517-1-pmenzel@molgen.mpg.de>
 <0214ae2639174812948a631ac4e142c8@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0214ae2639174812948a631ac4e142c8@AcuMS.aculab.com>
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
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:04:49 +1100
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David, et al --

...and then David Laight said...
% 
% From: Paul Menzel
% > Sent: 26 January 2022 11:42
% > 
% ..
% > +pound := \#
% 
% Please use 'hash' not 'pound'.

Ahem ...  Everyone knows that hash is best served hot and that
that symbol is an octothorpe.


% Only american greengrocers use that horrid name.
[snip]

*grin*


HAND

:-D
-- 
David T-G
See http://justpickone.org/davidtg/email/
See http://justpickone.org/davidtg/tofu.txt

