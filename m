Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D377D992
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 07:06:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6DpkG9u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQbgq2Kq9z3cW2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 15:05:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6DpkG9u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQbfx0JYhz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 15:05:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692162313; x=1723698313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NAt/0Qk/D8dIgi2ijgp9hAnTPFOpIpFTEMLFKhs/g/E=;
  b=h6DpkG9uyG4u6y+XHIcEuNoohofINtkeMh7l4Sno1SF84euK+5/MhS4l
   VB+3HoAL/sukWPE54cDXY79bjZ4pUFbO5/eR0rYBb1hdD3lY25lTI1CF3
   aAKoIhcISLSDfOkVsCq6qtR+3l+hswMmldNWTNZKOjKTMAngWlPYvVEJ+
   GIgKA6Cd/oDlydh90lMPbxOhEVKmQQCKnWxGwneAdu4s78+CrpB6e9gCo
   AYu0MHzMcDsfFsZ2Myg/6KGkpCFHUGE5SBOOIY+oB4D6Y3YgwTxLSf1hX
   ZoknmJOEDPd2pTmKnUeKnpWwGTVG58hFNo36w4khXJmsiWVN//SDkHeGM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371352490"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="371352490"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 22:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064688371"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="1064688371"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 22:04:49 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW8i8-0001WN-1w;
	Wed, 16 Aug 2023 05:04:48 +0000
Date: Wed, 16 Aug 2023 13:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: [powerpc:topic/ppc-kvm 3/6]
 arch/powerpc/kvm/guest-state-buffer.c:505: warning: expecting prototype for
 kvmppc_gsm_init(). Prototype was for kvmppc_gsm_new() instead
Message-ID: <202308161359.9d2Z52f5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
head:   c95bf4c16099f2ed29a7f6949559bc4187d30710
commit: 596bda338f11c9d2f860439733e5239100803d6c [3/6] KVM: PPC: Add helper library for Guest State Buffers
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230816/202308161359.9d2Z52f5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161359.9d2Z52f5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161359.9d2Z52f5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kvm/guest-state-buffer.c:505: warning: expecting prototype for kvmppc_gsm_init(). Prototype was for kvmppc_gsm_new() instead
>> arch/powerpc/kvm/guest-state-buffer.c:565: warning: expecting prototype for kvmppc_gsm_fill_info(). Prototype was for kvmppc_gsm_refresh_info() instead


vim +505 arch/powerpc/kvm/guest-state-buffer.c

   493	
   494	/**
   495	 * kvmppc_gsm_init() - creates a new guest state message
   496	 * @ops: callbacks
   497	 * @data: private data
   498	 * @flags: guest wide or thread wide
   499	 * @gfp_flags: GFP allocation flags
   500	 *
   501	 * Returns an initialized guest state message.
   502	 */
   503	struct kvmppc_gs_msg *kvmppc_gsm_new(struct kvmppc_gs_msg_ops *ops, void *data,
   504					     unsigned long flags, gfp_t gfp_flags)
 > 505	{
   506		struct kvmppc_gs_msg *gsm;
   507	
   508		gsm = kzalloc(sizeof(*gsm), gfp_flags);
   509		if (!gsm)
   510			return NULL;
   511	
   512		kvmppc_gsm_init(gsm, ops, data, flags);
   513	
   514		return gsm;
   515	}
   516	EXPORT_SYMBOL_GPL(kvmppc_gsm_new);
   517	
   518	/**
   519	 * kvmppc_gsm_size() - creates a new guest state message
   520	 * @gsm: self
   521	 *
   522	 * Returns the size required for the message.
   523	 */
   524	size_t kvmppc_gsm_size(struct kvmppc_gs_msg *gsm)
   525	{
   526		if (gsm->ops->get_size)
   527			return gsm->ops->get_size(gsm);
   528		return 0;
   529	}
   530	EXPORT_SYMBOL_GPL(kvmppc_gsm_size);
   531	
   532	/**
   533	 * kvmppc_gsm_free() - free guest state message
   534	 * @gsm: guest state message
   535	 *
   536	 * Returns the size required for the message.
   537	 */
   538	void kvmppc_gsm_free(struct kvmppc_gs_msg *gsm)
   539	{
   540		kfree(gsm);
   541	}
   542	EXPORT_SYMBOL_GPL(kvmppc_gsm_free);
   543	
   544	/**
   545	 * kvmppc_gsm_fill_info() - serialises message to guest state buffer format
   546	 * @gsm: self
   547	 * @gsb: buffer to serialise into
   548	 */
   549	int kvmppc_gsm_fill_info(struct kvmppc_gs_msg *gsm, struct kvmppc_gs_buff *gsb)
   550	{
   551		if (!gsm->ops->fill_info)
   552			return -EINVAL;
   553	
   554		return gsm->ops->fill_info(gsb, gsm);
   555	}
   556	EXPORT_SYMBOL_GPL(kvmppc_gsm_fill_info);
   557	
   558	/**
   559	 * kvmppc_gsm_fill_info() - deserialises from guest state buffer
   560	 * @gsm: self
   561	 * @gsb: buffer to serialise from
   562	 */
   563	int kvmppc_gsm_refresh_info(struct kvmppc_gs_msg *gsm,
   564				    struct kvmppc_gs_buff *gsb)
 > 565	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
