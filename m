Return-Path: <linuxppc-dev+bounces-16485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NBhFRiSfmkjawIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 00:36:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F73C45C0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 00:36:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3Tmc55PRz2ydq;
	Sun, 01 Feb 2026 10:36:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769902608;
	cv=none; b=RdzFm7UIlTmKhRyutQMxfBn+KnoZzfflKN9Jt7je/+IeaxxSb9/TuSMor9MZOYln30BgIgpVLWhQwAhemY9+BPgySy+8CV7RDvDfOYNnIZQsMecW8RIhqll/0aZLi1s/y9oMm3g8K5n6Sh93xXnpKRjErDORtArLm9nJTX8bqQN15dFFncOBYvOziwK6iBgKawqAFamQCKbqZvEcezesvZRqiwqW+YN3m5gH1jtWWpslUCm+Ono9sPK9rvvLV1SRKfA7pjyc5Ngq9+08O9VzCraawpU8xO3DDIAf+yhHUUDydrqJ+WxELyhPly7s9lfjhSeh8o9jWLoD6ySgFQa0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769902608; c=relaxed/relaxed;
	bh=0sV5mybvwYoGsRqcIRS6igEzPWnR62l8pdpUNCKhNRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YGglornVzTJ57SlXPcm4GfATTjNyro80HSl0tYgdV7iTtzZVfD+Mt5olSpPQrAftKdLEUbgqosHLZXujA44l98nOA7ScSomdzohdQf0Dq2ZWmpuinPtXn0SWSWV/UKQBCHEUN+SxPFSbiHz1T1Q3impxAynEV4WtLLoVHDAtnzzCm7xVbxvCpw/QGzYrHNbDe4xa3YWNUBOOJL9QOQmaeaNqpdjLok7xMeHlAh2u3Y6qLjRiBK3Maed6DkQy6oUovO9+3MgP096rTxusZNrgerKmzMx7Zmf3AvitdIf1pvF1bPCewGEvD2ZBBjUufTfqO6RiilQq0vFwmXCJaOBXoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKF7FdBi; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKF7FdBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3TmY5S51z2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Feb 2026 10:36:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769902606; x=1801438606;
  h=date:from:to:cc:subject:message-id;
  bh=0FTJg0lNL5RfOztQHIAkcq7zJiY3mW7es7fEq0MZFRY=;
  b=eKF7FdBirKjoUh7eSfNyP0KKeHvD538Vvkdqp4aRyZaALo7Dba9oq8FL
   qodNf94ZjmYeWABEEufCGpFnoIWG7MCQlYev8rZrIYTFDWHKUsC4RqZOu
   2sRxjGu2xxsmpUrIwx+ORgJdxBIIL8HcqXvZCE4YMzpQF6VXPwY6RkSEL
   pTN3g2R1mDjSt7D+4VuMgiCb+cHKm7bW/x+t7D192GqBnv2hlZ6Yg8Pxv
   LtFDCcbX6i74TerDrEkWizx+3myJn51kKNmRhQ6DOmTtdOyhJAze21A1d
   aXQ3R1xjXAPPgtew6bUw9v5es657fvpfnpEw6+FrpwhRnIDKjJwGISCcW
   w==;
X-CSE-ConnectionGUID: WKRUaZDoTtOM+kTX7W7+Lw==
X-CSE-MsgGUID: MOPS5uM6QPSODJrMEyXBSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="96573467"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="96573467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 15:36:36 -0800
X-CSE-ConnectionGUID: 07GYrTsvT0GU1VYGOrL/aQ==
X-CSE-MsgGUID: xIncafCZQQ2MkTidetOJnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="209142047"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2026 15:36:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmKVz-00000000eT6-0jC0;
	Sat, 31 Jan 2026 23:36:31 +0000
Date: Sun, 01 Feb 2026 07:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>
Subject: [powerpc:next-test 25/26] ERROR: modpost:
 "plpks_wrapping_is_supported" [security/keys/trusted-keys/trusted.ko]
 undefined!
Message-ID: <202602010724.1g9hbLKv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16485-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ssrish@linux.ibm.com,m:oe-kbuild-all@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:jarkko@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 01F73C45C0
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   1d72a02d65a733ad124bacc2db3fb90fa81a612b
commit: c99fcb0d735bdb6f06dfe6eb7134d5d988d32dae [25/26] keys/trusted_keys: establish PKWM as a trusted source
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260201/202602010724.1g9hbLKv-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010724.1g9hbLKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010724.1g9hbLKv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "plpks_wrapping_is_supported" [security/keys/trusted-keys/trusted.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

