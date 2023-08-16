Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132F77DA5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 08:18:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MrxqBZ9w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQdHt6g4Jz307V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 16:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MrxqBZ9w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQdH25fQ5z2yTc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 16:18:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692166687; x=1723702687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftrEa3GQYaOls0qYA4JlEDnZEFBIWQlkKuDFwVR24MI=;
  b=MrxqBZ9wh9LnR7/TFkNQtlgdmJpxsj8rpxpIep4WbDRUfgdg5Mu0uSUO
   DjOvW5b+HvWMSVVC+XOWBJmEkKYn6ErW6oP5Tq8FiwvMEeQKsYqqqI28A
   IdLQ5jrda1TCOy29YPfRnzM+9lTt8YbMUxcob/8iwqasoSVwjlsTXyFPO
   RL6cWNBBRZQ3101YvSVtGjYfrCAmvhM+K3x7TUQIq7wyuKpA113/oEFbK
   cK3f+WKcsPVIciYLa+Di8gqrAYSTFcAXBwslsPffF+S0nsABunI6zoqps
   UUKxBHqr16cktt9es/XcggjhTdaX+Gk0oPrQSOoundBpBGM2ff4QsYh+Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="369923968"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="369923968"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 23:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824121582"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="824121582"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2023 23:17:55 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW9qr-00003R-2o;
	Wed, 16 Aug 2023 06:17:54 +0000
Date: Wed, 16 Aug 2023 14:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: [powerpc:topic/ppc-kvm 5/6]
 arch/powerpc/kvm/book3s_hv_nestedv2.c:465:29: warning: variable 'amor' set
 but not used
Message-ID: <202308161433.p1L5wedY-lkp@intel.com>
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
Cc: Amit Machhiwal <amachhiw@linux.vnet.ibm.com>, Gautam Menghani <gautam@linux.ibm.com>, Kautuk Consul <kconsul@linux.vnet.ibm.com>, oe-kbuild-all@lists.linux.dev, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
head:   c95bf4c16099f2ed29a7f6949559bc4187d30710
commit: 6be7fd9b644945c2e4f9f071b9f8caa57f4e5590 [5/6] KVM: PPC: Add support for nestedv2 guests
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230816/202308161433.p1L5wedY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161433.p1L5wedY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161433.p1L5wedY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kvm/book3s_hv_nestedv2.c: In function 'gs_msg_ops_vcpu_refresh_info':
>> arch/powerpc/kvm/book3s_hv_nestedv2.c:465:29: warning: variable 'amor' set but not used [-Wunused-but-set-variable]
     465 |                         u64 amor;
         |                             ^~~~


vim +/amor +465 arch/powerpc/kvm/book3s_hv_nestedv2.c

   361	
   362	static int gs_msg_ops_vcpu_refresh_info(struct kvmppc_gs_msg *gsm,
   363						struct kvmppc_gs_buff *gsb)
   364	{
   365		struct kvmppc_gs_parser gsp = { 0 };
   366		struct kvmhv_nestedv2_io *io;
   367		struct kvmppc_gs_bitmap *valids;
   368		struct kvm_vcpu *vcpu;
   369		struct kvmppc_gs_elem *gse;
   370		vector128 v;
   371		int rc, i;
   372		u16 iden;
   373	
   374		vcpu = gsm->data;
   375	
   376		rc = kvmppc_gse_parse(&gsp, gsb);
   377		if (rc < 0)
   378			return rc;
   379	
   380		io = &vcpu->arch.nestedv2_io;
   381		valids = &io->valids;
   382	
   383		kvmppc_gsp_for_each(&gsp, iden, gse)
   384		{
   385			switch (iden) {
   386			case KVMPPC_GSID_DSCR:
   387				vcpu->arch.dscr = kvmppc_gse_get_u64(gse);
   388				break;
   389			case KVMPPC_GSID_MMCRA:
   390				vcpu->arch.mmcra = kvmppc_gse_get_u64(gse);
   391				break;
   392			case KVMPPC_GSID_HFSCR:
   393				vcpu->arch.hfscr = kvmppc_gse_get_u64(gse);
   394				break;
   395			case KVMPPC_GSID_PURR:
   396				vcpu->arch.purr = kvmppc_gse_get_u64(gse);
   397				break;
   398			case KVMPPC_GSID_SPURR:
   399				vcpu->arch.spurr = kvmppc_gse_get_u64(gse);
   400				break;
   401			case KVMPPC_GSID_AMR:
   402				vcpu->arch.amr = kvmppc_gse_get_u64(gse);
   403				break;
   404			case KVMPPC_GSID_UAMOR:
   405				vcpu->arch.uamor = kvmppc_gse_get_u64(gse);
   406				break;
   407			case KVMPPC_GSID_SIAR:
   408				vcpu->arch.siar = kvmppc_gse_get_u64(gse);
   409				break;
   410			case KVMPPC_GSID_SDAR:
   411				vcpu->arch.sdar = kvmppc_gse_get_u64(gse);
   412				break;
   413			case KVMPPC_GSID_IAMR:
   414				vcpu->arch.iamr = kvmppc_gse_get_u64(gse);
   415				break;
   416			case KVMPPC_GSID_DAWR0:
   417				vcpu->arch.dawr0 = kvmppc_gse_get_u64(gse);
   418				break;
   419			case KVMPPC_GSID_DAWR1:
   420				vcpu->arch.dawr1 = kvmppc_gse_get_u64(gse);
   421				break;
   422			case KVMPPC_GSID_DAWRX0:
   423				vcpu->arch.dawrx0 = kvmppc_gse_get_u32(gse);
   424				break;
   425			case KVMPPC_GSID_DAWRX1:
   426				vcpu->arch.dawrx1 = kvmppc_gse_get_u32(gse);
   427				break;
   428			case KVMPPC_GSID_CIABR:
   429				vcpu->arch.ciabr = kvmppc_gse_get_u64(gse);
   430				break;
   431			case KVMPPC_GSID_WORT:
   432				vcpu->arch.wort = kvmppc_gse_get_u32(gse);
   433				break;
   434			case KVMPPC_GSID_PPR:
   435				vcpu->arch.ppr = kvmppc_gse_get_u64(gse);
   436				break;
   437			case KVMPPC_GSID_PSPB:
   438				vcpu->arch.pspb = kvmppc_gse_get_u32(gse);
   439				break;
   440			case KVMPPC_GSID_TAR:
   441				vcpu->arch.tar = kvmppc_gse_get_u64(gse);
   442				break;
   443			case KVMPPC_GSID_FSCR:
   444				vcpu->arch.fscr = kvmppc_gse_get_u64(gse);
   445				break;
   446			case KVMPPC_GSID_EBBHR:
   447				vcpu->arch.ebbhr = kvmppc_gse_get_u64(gse);
   448				break;
   449			case KVMPPC_GSID_EBBRR:
   450				vcpu->arch.ebbrr = kvmppc_gse_get_u64(gse);
   451				break;
   452			case KVMPPC_GSID_BESCR:
   453				vcpu->arch.bescr = kvmppc_gse_get_u64(gse);
   454				break;
   455			case KVMPPC_GSID_IC:
   456				vcpu->arch.ic = kvmppc_gse_get_u64(gse);
   457				break;
   458			case KVMPPC_GSID_CTRL:
   459				vcpu->arch.ctrl = kvmppc_gse_get_u64(gse);
   460				break;
   461			case KVMPPC_GSID_PIDR:
   462				vcpu->arch.pid = kvmppc_gse_get_u32(gse);
   463				break;
   464			case KVMPPC_GSID_AMOR: {
 > 465				u64 amor;
   466	
   467				amor = kvmppc_gse_get_u64(gse);
   468				break;
   469			}
   470			case KVMPPC_GSID_VRSAVE:
   471				vcpu->arch.vrsave = kvmppc_gse_get_u32(gse);
   472				break;
   473			case KVMPPC_GSID_MMCR(0)... KVMPPC_GSID_MMCR(3):
   474				i = iden - KVMPPC_GSID_MMCR(0);
   475				vcpu->arch.mmcr[i] = kvmppc_gse_get_u64(gse);
   476				break;
   477			case KVMPPC_GSID_SIER(0)... KVMPPC_GSID_SIER(2):
   478				i = iden - KVMPPC_GSID_SIER(0);
   479				vcpu->arch.sier[i] = kvmppc_gse_get_u64(gse);
   480				break;
   481			case KVMPPC_GSID_PMC(0)... KVMPPC_GSID_PMC(5):
   482				i = iden - KVMPPC_GSID_PMC(0);
   483				vcpu->arch.pmc[i] = kvmppc_gse_get_u32(gse);
   484				break;
   485			case KVMPPC_GSID_GPR(0)... KVMPPC_GSID_GPR(31):
   486				i = iden - KVMPPC_GSID_GPR(0);
   487				vcpu->arch.regs.gpr[i] = kvmppc_gse_get_u64(gse);
   488				break;
   489			case KVMPPC_GSID_CR:
   490				vcpu->arch.regs.ccr = kvmppc_gse_get_u32(gse);
   491				break;
   492			case KVMPPC_GSID_XER:
   493				vcpu->arch.regs.xer = kvmppc_gse_get_u64(gse);
   494				break;
   495			case KVMPPC_GSID_CTR:
   496				vcpu->arch.regs.ctr = kvmppc_gse_get_u64(gse);
   497				break;
   498			case KVMPPC_GSID_LR:
   499				vcpu->arch.regs.link = kvmppc_gse_get_u64(gse);
   500				break;
   501			case KVMPPC_GSID_NIA:
   502				vcpu->arch.regs.nip = kvmppc_gse_get_u64(gse);
   503				break;
   504			case KVMPPC_GSID_SRR0:
   505				vcpu->arch.shregs.srr0 = kvmppc_gse_get_u64(gse);
   506				break;
   507			case KVMPPC_GSID_SRR1:
   508				vcpu->arch.shregs.srr1 = kvmppc_gse_get_u64(gse);
   509				break;
   510			case KVMPPC_GSID_SPRG0:
   511				vcpu->arch.shregs.sprg0 = kvmppc_gse_get_u64(gse);
   512				break;
   513			case KVMPPC_GSID_SPRG1:
   514				vcpu->arch.shregs.sprg1 = kvmppc_gse_get_u64(gse);
   515				break;
   516			case KVMPPC_GSID_SPRG2:
   517				vcpu->arch.shregs.sprg2 = kvmppc_gse_get_u64(gse);
   518				break;
   519			case KVMPPC_GSID_SPRG3:
   520				vcpu->arch.shregs.sprg3 = kvmppc_gse_get_u64(gse);
   521				break;
   522			case KVMPPC_GSID_DAR:
   523				vcpu->arch.shregs.dar = kvmppc_gse_get_u64(gse);
   524				break;
   525			case KVMPPC_GSID_DSISR:
   526				vcpu->arch.shregs.dsisr = kvmppc_gse_get_u32(gse);
   527				break;
   528			case KVMPPC_GSID_MSR:
   529				vcpu->arch.shregs.msr = kvmppc_gse_get_u64(gse);
   530				break;
   531			case KVMPPC_GSID_VTB:
   532				vcpu->arch.vcore->vtb = kvmppc_gse_get_u64(gse);
   533				break;
   534			case KVMPPC_GSID_LPCR:
   535				vcpu->arch.vcore->lpcr = kvmppc_gse_get_u64(gse);
   536				break;
   537			case KVMPPC_GSID_TB_OFFSET:
   538				vcpu->arch.vcore->tb_offset = kvmppc_gse_get_u64(gse);
   539				break;
   540			case KVMPPC_GSID_FPSCR:
   541				vcpu->arch.fp.fpscr = kvmppc_gse_get_u64(gse);
   542				break;
   543			case KVMPPC_GSID_VSRS(0)... KVMPPC_GSID_VSRS(31):
   544				kvmppc_gse_get_vector128(gse, &v);
   545				i = iden - KVMPPC_GSID_VSRS(0);
   546				memcpy(&vcpu->arch.fp.fpr[i], &v,
   547				       sizeof(vcpu->arch.fp.fpr[i]));
   548				break;
   549	#ifdef CONFIG_VSX
   550			case KVMPPC_GSID_VSCR:
   551				vcpu->arch.vr.vscr.u[3] = kvmppc_gse_get_u32(gse);
   552				break;
   553			case KVMPPC_GSID_VSRS(32)... KVMPPC_GSID_VSRS(63):
   554				i = iden - KVMPPC_GSID_VSRS(32);
   555				kvmppc_gse_get_vector128(gse, &vcpu->arch.vr.vr[i]);
   556				break;
   557	#endif
   558			case KVMPPC_GSID_HDAR:
   559				vcpu->arch.fault_dar = kvmppc_gse_get_u64(gse);
   560				break;
   561			case KVMPPC_GSID_HDSISR:
   562				vcpu->arch.fault_dsisr = kvmppc_gse_get_u32(gse);
   563				break;
   564			case KVMPPC_GSID_ASDR:
   565				vcpu->arch.fault_gpa = kvmppc_gse_get_u64(gse);
   566				break;
   567			case KVMPPC_GSID_HEIR:
   568				vcpu->arch.emul_inst = kvmppc_gse_get_u64(gse);
   569				break;
   570			case KVMPPC_GSID_DEC_EXPIRY_TB: {
   571				u64 dw;
   572	
   573				dw = kvmppc_gse_get_u64(gse);
   574				vcpu->arch.dec_expires =
   575					dw + vcpu->arch.vcore->tb_offset;
   576				break;
   577			}
   578			case KVMPPC_GSID_LOGICAL_PVR:
   579				vcpu->arch.vcore->arch_compat = kvmppc_gse_get_u32(gse);
   580				break;
   581			default:
   582				continue;
   583			}
   584			kvmppc_gsbm_set(valids, iden);
   585		}
   586	
   587		return 0;
   588	}
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
