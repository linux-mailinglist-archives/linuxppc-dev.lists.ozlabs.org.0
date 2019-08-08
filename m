Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1E185993
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 07:04:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463x9W2ySWzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 15:03:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463x7v0VKQzDqVK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 15:02:32 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 22:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; 
 d="gz'50?scan'50,208,50";a="186234121"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 07 Aug 2019 22:02:03 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hvaYt-000EF4-3H; Thu, 08 Aug 2019 13:02:03 +0800
Date: Thu, 8 Aug 2019 13:01:53 +0800
From: kbuild test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 09/44] powerpc/64s/pseries: machine check convert to
 use common event code
Message-ID: <201908081219.GBBn7JtE%lkp@intel.com>
References: <20190802105709.27696-10-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zfn343ridmo34b2v"
Content-Disposition: inline
In-Reply-To: <20190802105709.27696-10-npiggin@gmail.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@01.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--zfn343ridmo34b2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc3 next-20190807]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64s-exception-cleanup-and-macrofiy/20190802-222211
config: powerpc-defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/ras.c: In function 'mce_handle_error':
>> arch/powerpc/platforms/pseries/ras.c:563:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
       mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
       ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/ras.c:564:3: note: here
      case MC_ERROR_UE_PAGE_TABLE_WALK_IFETCH:
      ^~~~
   arch/powerpc/platforms/pseries/ras.c:565:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
       mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH;
       ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/ras.c:566:3: note: here
      case MC_ERROR_UE_LOAD_STORE:
      ^~~~
   arch/powerpc/platforms/pseries/ras.c:567:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
       mce_err.u.ue_error_type = MCE_UE_ERROR_LOAD_STORE;
       ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/ras.c:568:3: note: here
      case MC_ERROR_UE_PAGE_TABLE_WALK_LOAD_STORE:
      ^~~~
   arch/powerpc/platforms/pseries/ras.c:569:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
       mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE;
       ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/ras.c:570:3: note: here
      case MC_ERROR_UE_INDETERMINATE:
      ^~~~
   cc1: all warnings being treated as errors

vim +563 arch/powerpc/platforms/pseries/ras.c

   496	
   497	
   498	static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
   499	{
   500		struct mce_error_info mce_err = { 0 };
   501		unsigned long eaddr = 0, paddr = 0;
   502		struct pseries_errorlog *pseries_log;
   503		struct pseries_mc_errorlog *mce_log;
   504		int disposition = rtas_error_disposition(errp);
   505		int initiator = rtas_error_initiator(errp);
   506		int severity = rtas_error_severity(errp);
   507		u8 error_type, err_sub_type;
   508	
   509		if (initiator == RTAS_INITIATOR_UNKNOWN)
   510			mce_err.initiator = MCE_INITIATOR_UNKNOWN;
   511		else if (initiator == RTAS_INITIATOR_CPU)
   512			mce_err.initiator = MCE_INITIATOR_CPU;
   513		else if (initiator == RTAS_INITIATOR_PCI)
   514			mce_err.initiator = MCE_INITIATOR_PCI;
   515		else if (initiator == RTAS_INITIATOR_ISA)
   516			mce_err.initiator = MCE_INITIATOR_ISA;
   517		else if (initiator == RTAS_INITIATOR_MEMORY)
   518			mce_err.initiator = MCE_INITIATOR_MEMORY;
   519		else if (initiator == RTAS_INITIATOR_POWERMGM)
   520			mce_err.initiator = MCE_INITIATOR_POWERMGM;
   521		else
   522			mce_err.initiator = MCE_INITIATOR_UNKNOWN;
   523	
   524		if (severity == RTAS_SEVERITY_NO_ERROR)
   525			mce_err.severity = MCE_SEV_NO_ERROR;
   526		else if (severity == RTAS_SEVERITY_EVENT)
   527			mce_err.severity = MCE_SEV_WARNING;
   528		else if (severity == RTAS_SEVERITY_WARNING)
   529			mce_err.severity = MCE_SEV_WARNING;
   530		else if (severity == RTAS_SEVERITY_ERROR_SYNC)
   531			mce_err.severity = MCE_SEV_SEVERE;
   532		else if (severity == RTAS_SEVERITY_ERROR)
   533			mce_err.severity = MCE_SEV_SEVERE;
   534		else if (severity == RTAS_SEVERITY_FATAL)
   535			mce_err.severity = MCE_SEV_FATAL;
   536		else
   537			mce_err.severity = MCE_SEV_FATAL;
   538	
   539		if (severity <= RTAS_SEVERITY_ERROR_SYNC)
   540			mce_err.sync_error = true;
   541		else
   542			mce_err.sync_error = false;
   543	
   544		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
   545		mce_err.error_class = MCE_ECLASS_UNKNOWN;
   546	
   547		if (!rtas_error_extended(errp))
   548			goto out;
   549	
   550		pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
   551		if (pseries_log == NULL)
   552			goto out;
   553	
   554		mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
   555		error_type = mce_log->error_type;
   556		err_sub_type = rtas_mc_error_sub_type(mce_log);
   557	
   558		switch (mce_log->error_type) {
   559		case MC_ERROR_TYPE_UE:
   560			mce_err.error_type = MCE_ERROR_TYPE_UE;
   561			switch (err_sub_type) {
   562			case MC_ERROR_UE_IFETCH:
 > 563				mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
   564			case MC_ERROR_UE_PAGE_TABLE_WALK_IFETCH:
   565				mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH;
   566			case MC_ERROR_UE_LOAD_STORE:
   567				mce_err.u.ue_error_type = MCE_UE_ERROR_LOAD_STORE;
   568			case MC_ERROR_UE_PAGE_TABLE_WALK_LOAD_STORE:
   569				mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE;
   570			case MC_ERROR_UE_INDETERMINATE:
   571			default:
   572				mce_err.u.ue_error_type = MCE_UE_ERROR_INDETERMINATE;
   573				break;
   574			}
   575			if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED)
   576				eaddr = be64_to_cpu(mce_log->effective_address);
   577	
   578			if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED) {
   579				paddr = be64_to_cpu(mce_log->logical_address);
   580			} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
   581				unsigned long pfn;
   582	
   583				pfn = addr_to_pfn(regs, eaddr);
   584				if (pfn != ULONG_MAX)
   585					paddr = pfn << PAGE_SHIFT;
   586			}
   587	
   588	
   589			break;
   590		case MC_ERROR_TYPE_SLB:
   591			mce_err.error_type = MCE_ERROR_TYPE_SLB;
   592			switch (err_sub_type) {
   593			case MC_ERROR_SLB_PARITY:
   594				mce_err.u.slb_error_type = MCE_SLB_ERROR_PARITY;
   595				break;
   596			case MC_ERROR_SLB_MULTIHIT:
   597				mce_err.u.slb_error_type = MCE_SLB_ERROR_MULTIHIT;
   598				break;
   599			case MC_ERROR_SLB_INDETERMINATE:
   600			default:
   601				mce_err.u.slb_error_type = MCE_SLB_ERROR_INDETERMINATE;
   602				break;
   603			}
   604			if (mce_log->sub_err_type & 0x80)
   605				eaddr = be64_to_cpu(mce_log->effective_address);
   606			break;
   607		case MC_ERROR_TYPE_ERAT:
   608			mce_err.error_type = MCE_ERROR_TYPE_ERAT;
   609			switch (err_sub_type) {
   610			case MC_ERROR_ERAT_PARITY:
   611				mce_err.u.erat_error_type = MCE_ERAT_ERROR_PARITY;
   612				break;
   613			case MC_ERROR_ERAT_MULTIHIT:
   614				mce_err.u.erat_error_type = MCE_ERAT_ERROR_MULTIHIT;
   615				break;
   616			case MC_ERROR_ERAT_INDETERMINATE:
   617			default:
   618				mce_err.u.erat_error_type = MCE_ERAT_ERROR_INDETERMINATE;
   619				break;
   620			}
   621			if (mce_log->sub_err_type & 0x80)
   622				eaddr = be64_to_cpu(mce_log->effective_address);
   623			break;
   624		case MC_ERROR_TYPE_TLB:
   625			mce_err.error_type = MCE_ERROR_TYPE_TLB;
   626			switch (err_sub_type) {
   627			case MC_ERROR_TLB_PARITY:
   628				mce_err.u.tlb_error_type = MCE_TLB_ERROR_PARITY;
   629				break;
   630			case MC_ERROR_TLB_MULTIHIT:
   631				mce_err.u.tlb_error_type = MCE_TLB_ERROR_MULTIHIT;
   632				break;
   633			case MC_ERROR_TLB_INDETERMINATE:
   634			default:
   635				mce_err.u.tlb_error_type = MCE_TLB_ERROR_INDETERMINATE;
   636				break;
   637			}
   638			if (mce_log->sub_err_type & 0x80)
   639				eaddr = be64_to_cpu(mce_log->effective_address);
   640			break;
   641		case MC_ERROR_TYPE_D_CACHE:
   642			mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
   643			break;
   644		case MC_ERROR_TYPE_I_CACHE:
   645			mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
   646			break;
   647		case MC_ERROR_TYPE_UNKNOWN:
   648		default:
   649			mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
   650			break;
   651		}
   652	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--zfn343ridmo34b2v
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
mv8HevEMdJudAQA=

--zfn343ridmo34b2v--
