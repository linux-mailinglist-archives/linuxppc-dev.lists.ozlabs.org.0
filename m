Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 052601ABD9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 12:07:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492vzq0LYFzDrb6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 20:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jani.nikula@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492vxv0GBxzDrRV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 20:05:57 +1000 (AEST)
IronPort-SDR: mwMuG9Vzx28dX+ZJdIXuPBY4NZF5XQTyxutB21XXx+7jEsc+tQn8bjv85CCrGIloWe4zEI3tAA
 IF589Ys+fLNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 03:05:53 -0700
IronPort-SDR: RjBv+uX+qdBSawkGTFreimgV4amAPsx7yEe1IJ3aQIXgdP4x219JR8hl3o9eqO/hwoAVeQq9M9
 UXTLT5nwMsgA==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="427781153"
Received: from ellenfax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.44.122])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 03:05:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 0/2] Don't generate thousands of new warnings when
 building docs
In-Reply-To: <20200320171020.78f045c5@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1584716446.git.mchehab+huawei@kernel.org>
 <20200320171020.78f045c5@lwn.net>
Date: Thu, 16 Apr 2020 13:05:39 +0300
Message-ID: <87a73b4ufg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 target-devel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 linux-scsi@vger.kernel.org, x86@kernel.org, Tyler Hicks <code@tyhicks.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Luca Ceresoli <luca@lucaceresoli.net>,
 Johannes Berg <johannes.berg@intel.com>, ecryptfs@vger.kernel.org,
 Matthias Maennich <maennich@google.com>, dmaengine@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Harry Wei <harryxiyou@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Mar 2020, Jonathan Corbet <corbet@lwn.net> wrote:
> On Fri, 20 Mar 2020 16:11:01 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
>> This small series address a regression caused by a new patch at
>> docs-next (and at linux-next).
>
> I don't know how I missed that mess, sorry.  I plead distracting times or
> something like that.  Heck, I think I'll blame everything on the plague
> for at least the next few weeks.
>
> Anyway, I've applied this, thanks for cleaning it up.

There's still more fallout from the autosectionlabel extension
introduced in 58ad30cf91f0 ("docs: fix reference to
core-api/namespaces.rst"), e.g. in i915.rst.

The biggest trouble is, if you have headings in kernel-doc comments,
Sphinx is unable pinpoint where the dupes are. For example:

 Documentation/gpu/i915.rst:610: WARNING: duplicate label gpu/i915:layout, other instance in
 Documentation/gpu/i915.rst

However there is no "layout" label in i915.rst. The one being warned
about I can dig into based on the line number, but not the second
one. You have to resort to grepping the source. And avoiding duplicate
subsection headings in completely isolated places is a minefield.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
