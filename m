Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2419F48F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:31:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wpK85VbZzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 21:31:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wpHC0ZVxzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 21:29:56 +1000 (AEST)
IronPort-SDR: TbolTYzQycbANlEb129XjK1MQJAPaXPMlWO6rH4FD53PuqGw0TooUXyAKgehDlWfXzZaou1ID1
 mM0YVtfVhTaA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:29:53 -0700
IronPort-SDR: RqFCVU59mRmdFotOTyKsaIrZ9e2ZaKeObPdkJvROM7dDICf95IylEgIALffadLAbaDiGqL5dmb
 KwxQvTIEOE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; 
 d="gz'50?scan'50,208,50";a="397468358"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 06 Apr 2020 04:29:50 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jLPwr-0000YE-VX; Mon, 06 Apr 2020 19:29:49 +0800
Date: Mon, 6 Apr 2020 19:29:30 +0800
From: kbuild test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v5 20/21] powerpc sstep: Add support for prefixed
 load/stores
Message-ID: <202004061956.XBCNZwlO%lkp@intel.com>
References: <20200406080936.7180-21-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20200406080936.7180-21-jniethe5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Jordan Niethe <jniethe5@gmail.com>,
 npiggin@gmail.com, bala24@linux.ibm.com, alistair@popple.id.au,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jordan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.6]
[cannot apply to powerpc/next kvm-ppc/kvm-ppc-next scottwood/next next-20200406]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jordan-Niethe/Initial-Prefixed-Instruction-support/20200406-165215
base:    7111951b8d4973bda27ff663f2cf18b663d15b48
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/code-patching.h:14,
                    from arch/powerpc/include/asm/kprobes.h:24,
                    from include/linux/kprobes.h:30,
                    from arch/powerpc/lib/sstep.c:8:
   arch/powerpc/include/asm/inst.h:69:38: error: unknown type name 'ppc_inst'
      69 | static inline bool ppc_inst_prefixed(ppc_inst x)
         |                                      ^~~~~~~~
   arch/powerpc/include/asm/inst.h:79:19: error: redefinition of 'ppc_inst_val'
      79 | static inline u32 ppc_inst_val(struct ppc_inst x)
         |                   ^~~~~~~~~~~~
   arch/powerpc/include/asm/inst.h:21:19: note: previous definition of 'ppc_inst_val' was here
      21 | static inline u32 ppc_inst_val(struct ppc_inst x)
         |                   ^~~~~~~~~~~~
   arch/powerpc/include/asm/inst.h: In function 'ppc_inst_len':
   arch/powerpc/include/asm/inst.h:103:10: error: implicit declaration of function 'ppc_inst_prefixed'; did you mean 'ppc_inst_write'? [-Werror=implicit-function-declaration]
     103 |  return (ppc_inst_prefixed(x)) ? 8  : 4;
         |          ^~~~~~~~~~~~~~~~~
         |          ppc_inst_write
   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
   arch/powerpc/lib/sstep.c:1215:11: error: implicit declaration of function 'ppc_inst_suffix'; did you mean 'ppc_inst_swab'? [-Werror=implicit-function-declaration]
    1215 |  suffix = ppc_inst_suffix(instr);
         |           ^~~~~~~~~~~~~~~
         |           ppc_inst_swab
>> arch/powerpc/lib/sstep.c:1207:41: error: unused variable 'prefix_r' [-Werror=unused-variable]
    1207 |  unsigned int suffixopcode, prefixtype, prefix_r;
         |                                         ^~~~~~~~
>> arch/powerpc/lib/sstep.c:1207:29: error: unused variable 'prefixtype' [-Werror=unused-variable]
    1207 |  unsigned int suffixopcode, prefixtype, prefix_r;
         |                             ^~~~~~~~~~
>> arch/powerpc/lib/sstep.c:1207:15: error: unused variable 'suffixopcode' [-Werror=unused-variable]
    1207 |  unsigned int suffixopcode, prefixtype, prefix_r;
         |               ^~~~~~~~~~~~
   cc1: all warnings being treated as errors

vim +/prefix_r +1207 arch/powerpc/lib/sstep.c

  1191	
  1192	/*
  1193	 * Decode an instruction, and return information about it in *op
  1194	 * without changing *regs.
  1195	 * Integer arithmetic and logical instructions, branches, and barrier
  1196	 * instructions can be emulated just using the information in *op.
  1197	 *
  1198	 * Return value is 1 if the instruction can be emulated just by
  1199	 * updating *regs with the information in *op, -1 if we need the
  1200	 * GPRs but *regs doesn't contain the full register set, or 0
  1201	 * otherwise.
  1202	 */
  1203	int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
  1204			  struct ppc_inst instr)
  1205	{
  1206		unsigned int opcode, ra, rb, rc, rd, spr, u;
> 1207		unsigned int suffixopcode, prefixtype, prefix_r;
  1208		unsigned long int imm;
  1209		unsigned long int val, val2;
  1210		unsigned int mb, me, sh;
  1211		unsigned int word, suffix;
  1212		long ival;
  1213	
  1214		word = ppc_inst_val(instr);
  1215		suffix = ppc_inst_suffix(instr);
  1216	
  1217		op->type = COMPUTE;
  1218	
  1219		opcode = word >> 26;
  1220		switch (opcode) {
  1221		case 16:	/* bc */
  1222			op->type = BRANCH;
  1223			imm = (signed short)(word & 0xfffc);
  1224			if ((word & 2) == 0)
  1225				imm += regs->nip;
  1226			op->val = truncate_if_32bit(regs->msr, imm);
  1227			if (word & 1)
  1228				op->type |= SETLK;
  1229			if (branch_taken(word, regs, op))
  1230				op->type |= BRTAKEN;
  1231			return 1;
  1232	#ifdef CONFIG_PPC64
  1233		case 17:	/* sc */
  1234			if ((word & 0xfe2) == 2)
  1235				op->type = SYSCALL;
  1236			else
  1237				op->type = UNKNOWN;
  1238			return 0;
  1239	#endif
  1240		case 18:	/* b */
  1241			op->type = BRANCH | BRTAKEN;
  1242			imm = word & 0x03fffffc;
  1243			if (imm & 0x02000000)
  1244				imm -= 0x04000000;
  1245			if ((word & 2) == 0)
  1246				imm += regs->nip;
  1247			op->val = truncate_if_32bit(regs->msr, imm);
  1248			if (word & 1)
  1249				op->type |= SETLK;
  1250			return 1;
  1251		case 19:
  1252			switch ((word >> 1) & 0x3ff) {
  1253			case 0:		/* mcrf */
  1254				op->type = COMPUTE + SETCC;
  1255				rd = 7 - ((word >> 23) & 0x7);
  1256				ra = 7 - ((word >> 18) & 0x7);
  1257				rd *= 4;
  1258				ra *= 4;
  1259				val = (regs->ccr >> ra) & 0xf;
  1260				op->ccval = (regs->ccr & ~(0xfUL << rd)) | (val << rd);
  1261				return 1;
  1262	
  1263			case 16:	/* bclr */
  1264			case 528:	/* bcctr */
  1265				op->type = BRANCH;
  1266				imm = (word & 0x400)? regs->ctr: regs->link;
  1267				op->val = truncate_if_32bit(regs->msr, imm);
  1268				if (word & 1)
  1269					op->type |= SETLK;
  1270				if (branch_taken(word, regs, op))
  1271					op->type |= BRTAKEN;
  1272				return 1;
  1273	
  1274			case 18:	/* rfid, scary */
  1275				if (regs->msr & MSR_PR)
  1276					goto priv;
  1277				op->type = RFI;
  1278				return 0;
  1279	
  1280			case 150:	/* isync */
  1281				op->type = BARRIER | BARRIER_ISYNC;
  1282				return 1;
  1283	
  1284			case 33:	/* crnor */
  1285			case 129:	/* crandc */
  1286			case 193:	/* crxor */
  1287			case 225:	/* crnand */
  1288			case 257:	/* crand */
  1289			case 289:	/* creqv */
  1290			case 417:	/* crorc */
  1291			case 449:	/* cror */
  1292				op->type = COMPUTE + SETCC;
  1293				ra = (word >> 16) & 0x1f;
  1294				rb = (word >> 11) & 0x1f;
  1295				rd = (word >> 21) & 0x1f;
  1296				ra = (regs->ccr >> (31 - ra)) & 1;
  1297				rb = (regs->ccr >> (31 - rb)) & 1;
  1298				val = (word >> (6 + ra * 2 + rb)) & 1;
  1299				op->ccval = (regs->ccr & ~(1UL << (31 - rd))) |
  1300					(val << (31 - rd));
  1301				return 1;
  1302			}
  1303			break;
  1304		case 31:
  1305			switch ((word >> 1) & 0x3ff) {
  1306			case 598:	/* sync */
  1307				op->type = BARRIER + BARRIER_SYNC;
  1308	#ifdef __powerpc64__
  1309				switch ((word >> 21) & 3) {
  1310				case 1:		/* lwsync */
  1311					op->type = BARRIER + BARRIER_LWSYNC;
  1312					break;
  1313				case 2:		/* ptesync */
  1314					op->type = BARRIER + BARRIER_PTESYNC;
  1315					break;
  1316				}
  1317	#endif
  1318				return 1;
  1319	
  1320			case 854:	/* eieio */
  1321				op->type = BARRIER + BARRIER_EIEIO;
  1322				return 1;
  1323			}
  1324			break;
  1325		}
  1326	
  1327		/* Following cases refer to regs->gpr[], so we need all regs */
  1328		if (!FULL_REGS(regs))
  1329			return -1;
  1330	
  1331		rd = (word >> 21) & 0x1f;
  1332		ra = (word >> 16) & 0x1f;
  1333		rb = (word >> 11) & 0x1f;
  1334		rc = (word >> 6) & 0x1f;
  1335	
  1336		switch (opcode) {
  1337	#ifdef __powerpc64__
  1338		case 2:		/* tdi */
  1339			if (rd & trap_compare(regs->gpr[ra], (short) word))
  1340				goto trap;
  1341			return 1;
  1342	#endif
  1343		case 3:		/* twi */
  1344			if (rd & trap_compare((int)regs->gpr[ra], (short) word))
  1345				goto trap;
  1346			return 1;
  1347	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--3V7upXqbjpZ4EhLz
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--3V7upXqbjpZ4EhLz--
