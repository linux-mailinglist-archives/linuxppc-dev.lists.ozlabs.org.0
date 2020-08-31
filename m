Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45F25849C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 02:01:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgS0t6ph6zDqV5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 10:01:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgRx427DRzDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 09:58:26 +1000 (AEST)
IronPort-SDR: 83OGiqxBFT/MBARo6bdzrgqDzHA30prjAYEaCNmoTfjVQMFn2gfQ3uoPRBsVRuQPowLN1Hu/G9
 hjBz7ldxbxkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="157080823"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
 d="gz'50?scan'50,208,50";a="157080823"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 16:58:21 -0700
IronPort-SDR: icFgaaeo4DAuQqeW3/uzv/Y7Ad4CWQbhi/IWln7j42Wv5zksyHHg4TTa/SKI9Dd9B5Tfj7iZcz
 STYf7S5Mzu/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
 d="gz'50?scan'50,208,50";a="281793844"
Received: from lkp-server02.sh.intel.com (HELO 713faec3b0e5) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2020 16:58:18 -0700
Received: from kbuild by 713faec3b0e5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kCtgn-0000FA-U1; Mon, 31 Aug 2020 23:58:17 +0000
Date: Tue, 1 Sep 2020 07:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
Subject: Re: [PATCH] scsi: ibmvfc: interface updates for future FPIN and MQ
 support
Message-ID: <202009010718.dLKlN1SD%lkp@intel.com>
References: <20200831171844.635729-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20200831171844.635729-1-tyreld@linux.ibm.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, kbuild-all@lists.01.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tyrel,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on mkp-scsi/for-next scsi/for-next v5.9-rc3 next-20200828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tyrel-Datwyler/scsi-ibmvfc-interface-updates-for-future-FPIN-and-MQ-support/20200901-012005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/ibmvscsi/ibmvfc.c:32:
>> drivers/scsi/ibmvscsi/ibmvfc.h:500:13: error: expected ':', ',', ';', '}' or '__attribute__' before 'nvmeof_vas_channels'
     500 |  __be32 num nvmeof_vas_channels;
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/ibmvscsi/ibmvfc.h:506:17: error: expected declaration specifiers or '...' before '(' token
     506 | }__attrribute__((packed, aligned (8)));
         |                 ^
>> drivers/scsi/ibmvscsi/ibmvfc.h:526:28: error: field 'common' has incomplete type
     526 |  struct ibmvfc_madd_common common;
         |                            ^~~~~~
>> drivers/scsi/ibmvscsi/ibmvfc.h:627:2: error: expected ':', ',', ';', '}' or '__attribute__' before 'u8'
     627 |  u8 pad;
         |  ^~
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/powerpc/include/asm/bitops.h:246,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/scsi/ibmvscsi/ibmvfc.c:10:
   drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_handle_async':
>> drivers/scsi/ibmvscsi/ibmvfc.c:2665:75: error: 'struct ibmvfc_async_crq' has no member named 'event'
    2665 |  const struct ibmvfc_async_desc *desc = ibmvfc_get_ae_desc(be64_to_cpu(crq->event));
         |                                                                           ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
      38 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/scsi/ibmvscsi/ibmvfc.c:2665:60: note: in expansion of macro 'be64_to_cpu'
    2665 |  const struct ibmvfc_async_desc *desc = ibmvfc_get_ae_desc(be64_to_cpu(crq->event));
         |                                                            ^~~~~~~~~~~
>> drivers/scsi/ibmvscsi/ibmvfc.c:2669:57: error: 'struct ibmvfc_async_crq' has no member named 'scsi_id'
    2669 |      " node_name: %llx%s\n", desc->desc, be64_to_cpu(crq->scsi_id),
         |                                                         ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
      38 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/scsi/ibmvscsi/ibmvfc.h:818:4: note: in expansion of macro 'dev_err'
     818 |    dev_err((vhost)->dev, ##__VA_ARGS__); \
         |    ^~~~~~~
   drivers/scsi/ibmvscsi/ibmvfc.c:2668:2: note: in expansion of macro 'ibmvfc_log'
    2668 |  ibmvfc_log(vhost, desc->log_level, "%s event received. scsi_id: %llx, wwpn: %llx,"
         |  ^~~~~~~~~~
>> drivers/scsi/ibmvscsi/ibmvfc.c:2670:21: error: 'struct ibmvfc_async_crq' has no member named 'wwpn'
    2670 |      be64_to_cpu(crq->wwpn), be64_to_cpu(crq->node_name),
         |                     ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
      38 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/scsi/ibmvscsi/ibmvfc.h:818:4: note: in expansion of macro 'dev_err'
     818 |    dev_err((vhost)->dev, ##__VA_ARGS__); \
         |    ^~~~~~~
   drivers/scsi/ibmvscsi/ibmvfc.c:2668:2: note: in expansion of macro 'ibmvfc_log'
    2668 |  ibmvfc_log(vhost, desc->log_level, "%s event received. scsi_id: %llx, wwpn: %llx,"
         |  ^~~~~~~~~~
>> drivers/scsi/ibmvscsi/ibmvfc.c:2670:45: error: 'struct ibmvfc_async_crq' has no member named 'node_name'
    2670 |      be64_to_cpu(crq->wwpn), be64_to_cpu(crq->node_name),
         |                                             ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
      38 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/scsi/ibmvscsi/ibmvfc.h:818:4: note: in expansion of macro 'dev_err'
     818 |    dev_err((vhost)->dev, ##__VA_ARGS__); \
         |    ^~~~~~~
   drivers/scsi/ibmvscsi/ibmvfc.c:2668:2: note: in expansion of macro 'ibmvfc_log'
    2668 |  ibmvfc_log(vhost, desc->log_level, "%s event received. scsi_id: %llx, wwpn: %llx,"
         |  ^~~~~~~~~~
   drivers/scsi/ibmvscsi/ibmvfc.c:2673:25: error: 'struct ibmvfc_async_crq' has no member named 'event'
    2673 |  switch (be64_to_cpu(crq->event)) {
         |                         ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
      38 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/scsi/ibmvscsi/ibmvfc.c:2673:10: note: in expansion of macro 'be64_to_cpu'
    2673 |  switch (be64_to_cpu(crq->event)) {
         |          ^~~~~~~~~~~
   drivers/scsi/ibmvscsi/ibmvfc.c:2714:12: error: 'struct ibmvfc_async_crq' has no member named 'scsi_id'
    2714 |    if (!crq->scsi_id && !crq->wwpn && !crq->node_name)
         |            ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2714:29: error: 'struct ibmvfc_async_crq' has no member named 'wwpn'
    2714 |    if (!crq->scsi_id && !crq->wwpn && !crq->node_name)
         |                             ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2714:43: error: 'struct ibmvfc_async_crq' has no member named 'node_name'
    2714 |    if (!crq->scsi_id && !crq->wwpn && !crq->node_name)
         |                                           ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2716:11: error: 'struct ibmvfc_async_crq' has no member named 'scsi_id'
    2716 |    if (crq->scsi_id && cpu_to_be64(tgt->scsi_id) != crq->scsi_id)
         |           ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2716:56: error: 'struct ibmvfc_async_crq' has no member named 'scsi_id'
    2716 |    if (crq->scsi_id && cpu_to_be64(tgt->scsi_id) != crq->scsi_id)
         |                                                        ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2718:11: error: 'struct ibmvfc_async_crq' has no member named 'wwpn'
    2718 |    if (crq->wwpn && cpu_to_be64(tgt->ids.port_name) != crq->wwpn)
         |           ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2718:59: error: 'struct ibmvfc_async_crq' has no member named 'wwpn'
    2718 |    if (crq->wwpn && cpu_to_be64(tgt->ids.port_name) != crq->wwpn)
         |                                                           ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2720:11: error: 'struct ibmvfc_async_crq' has no member named 'node_name'
    2720 |    if (crq->node_name && cpu_to_be64(tgt->ids.node_name) != crq->node_name)
         |           ^~
   drivers/scsi/ibmvscsi/ibmvfc.c:2720:64: error: 'struct ibmvfc_async_crq' has no member named 'node_name'
    2720 |    if (crq->node_name && cpu_to_be64(tgt->ids.node_name) != crq->node_name)
         |                                                                ^~
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/powerpc/include/asm/bitops.h:246,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/scsi/ibmvscsi/ibmvfc.c:10:
   drivers/scsi/ibmvscsi/ibmvfc.c:2722:42: error: 'struct ibmvfc_async_crq' has no member named 'event'
    2722 |    if (tgt->need_login && be64_to_cpu(crq->event) == IBMVFC_AE_ELS_LOGO)
         |                                          ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
      38 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/scsi/ibmvscsi/ibmvfc.c:2722:27: note: in expansion of macro 'be64_to_cpu'
    2722 |    if (tgt->need_login && be64_to_cpu(crq->event) == IBMVFC_AE_ELS_LOGO)
         |                           ^~~~~~~~~~~
   drivers/scsi/ibmvscsi/ibmvfc.c:2724:43: error: 'struct ibmvfc_async_crq' has no member named 'event'
    2724 |    if (!tgt->need_login || be64_to_cpu(crq->event) == IBMVFC_AE_ELS_PLOGI) {
         |                                           ^~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
      38 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/scsi/ibmvscsi/ibmvfc.c:2724:28: note: in expansion of macro 'be64_to_cpu'
    2724 |    if (!tgt->need_login || be64_to_cpu(crq->event) == IBMVFC_AE_ELS_PLOGI) {
         |                            ^~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/scsi/ibmvscsi/ibmvfc.c:12:
   drivers/scsi/ibmvscsi/ibmvfc.c:2741:66: error: 'struct ibmvfc_async_crq' has no member named 'event'
    2741 |   dev_err(vhost->dev, "Unknown async event received: %lld\n", crq->event);
         |                                                                  ^~
   include/linux/dev_printk.h:104:32: note: in definition of macro 'dev_err'
     104 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                ^~~~~~~~~~~

# https://github.com/0day-ci/linux/commit/b2aced49faf50075e9a74e7a253d1ad77cce1c0c
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Tyrel-Datwyler/scsi-ibmvfc-interface-updates-for-future-FPIN-and-MQ-support/20200901-012005
git checkout b2aced49faf50075e9a74e7a253d1ad77cce1c0c
vim +500 drivers/scsi/ibmvscsi/ibmvfc.h

   490	
   491	struct ibmvfc_channel_enquiry {
   492		struct ibmvfc_mad_common common;
   493		__be32 flags;
   494	#define IBMVFC_NO_CHANNELS_TO_CRQ_SUPPORT	0x01
   495	#define IBMVFC_SUPPORT_VARIABLE_SUBQ_MSG	0x02
   496	#define IBMVFC_NO_N_TO_M_CHANNELS_SUPPORT	0x04
   497		__be32 num_scsi_subq_channels;
   498		__be32 num_nvmeof_subq_channels;
   499		__be32 num_scsi_vas_channels;
 > 500		__be32 num nvmeof_vas_channels;
   501	}__attribute__((packed, aligned (8)));
   502	
   503	struct ibmvfc_channel_setup_mad {
   504		struct ibmvfc_mad_common common;
   505		struct srp_direct_buf buffer;
 > 506	}__attrribute__((packed, aligned (8)));
   507	
   508	#define IBMVFC_MAX_CHANNELS	502
   509	
   510	struct ibmvfc_channel_setup {
   511		__be32 flags;
   512	#define IBMVFC_CANCEL_CHANNELS		0x01
   513	#define IBMVFC_USE_BUFFER		0x02
   514	#define IBMVFC_CHANNELS_CANCELED	0x04
   515		__be32 reserved;
   516		__be32 num_scsi_subq_channels;
   517		__be32 num_nvmeof_subq_channels;
   518		__be32 num_scsi_vas_channels;
   519		__be32 num_nvmeof_vas_channels;
   520		struct srp_direct_buf buffer;
   521		__be64 reserved2[5];
   522		__be64 channel_handles[IBMVFC_MAX_CHANNELS];
   523	}__attribute__((packed, aligned (8)));
   524	
   525	struct ibmvfc_connection_info {
 > 526		struct ibmvfc_madd_common common;
   527		__be64 information_bits;
   528	#define IBMVFC_NO_FC_IO_CHANNEL		0x01
   529	#define IBMVFC_NO_PHYP_VAS		0x02
   530	#define IBMVFC_NO_PHYP_SUBQ		0x04
   531	#define IBMVFC_PHYP_DEPRECATED_SUBQ	0x08
   532	#define IBMVFC_PHYP_PRESERVED_SUBQ	0x10
   533	#define IBMVFC_PHYP_FULL_SUBQ		0x20
   534		__be64 reserved[16];
   535	}__attribute__((packed, aligned (8)));
   536	
   537	struct ibmvfc_trace_start_entry {
   538		u32 xfer_len;
   539	}__attribute__((packed));
   540	
   541	struct ibmvfc_trace_end_entry {
   542		u16 status;
   543		u16 error;
   544		u8 fcp_rsp_flags;
   545		u8 rsp_code;
   546		u8 scsi_status;
   547		u8 reserved;
   548	}__attribute__((packed));
   549	
   550	struct ibmvfc_trace_entry {
   551		struct ibmvfc_event *evt;
   552		u32 time;
   553		u32 scsi_id;
   554		u32 lun;
   555		u8 fmt;
   556		u8 op_code;
   557		u8 tmf_flags;
   558		u8 type;
   559	#define IBMVFC_TRC_START	0x00
   560	#define IBMVFC_TRC_END		0xff
   561		union {
   562			struct ibmvfc_trace_start_entry start;
   563			struct ibmvfc_trace_end_entry end;
   564		} u;
   565	}__attribute__((packed, aligned (8)));
   566	
   567	enum ibmvfc_crq_formats {
   568		IBMVFC_CMD_FORMAT		= 0x01,
   569		IBMVFC_ASYNC_EVENT	= 0x02,
   570		IBMVFC_MAD_FORMAT		= 0x04,
   571	};
   572	
   573	enum ibmvfc_async_event {
   574		IBMVFC_AE_ELS_PLOGI		= 0x0001,
   575		IBMVFC_AE_ELS_LOGO		= 0x0002,
   576		IBMVFC_AE_ELS_PRLO		= 0x0004,
   577		IBMVFC_AE_SCN_NPORT		= 0x0008,
   578		IBMVFC_AE_SCN_GROUP		= 0x0010,
   579		IBMVFC_AE_SCN_DOMAIN		= 0x0020,
   580		IBMVFC_AE_SCN_FABRIC		= 0x0040,
   581		IBMVFC_AE_LINK_UP			= 0x0080,
   582		IBMVFC_AE_LINK_DOWN		= 0x0100,
   583		IBMVFC_AE_LINK_DEAD		= 0x0200,
   584		IBMVFC_AE_HALT			= 0x0400,
   585		IBMVFC_AE_RESUME			= 0x0800,
   586		IBMVFC_AE_ADAPTER_FAILED	= 0x1000,
   587		IBMVFC_AE_FPIN			= 0x2000,
   588	};
   589	
   590	struct ibmvfc_async_desc {
   591		const char *desc;
   592		enum ibmvfc_async_event ae;
   593		int log_level;
   594	};
   595	
   596	struct ibmvfc_crq {
   597		volatile u8 valid;
   598		volatile u8 format;
   599		u8 reserved[6];
   600		volatile __be64 ioba;
   601	}__attribute__((packed, aligned (8)));
   602	
   603	struct ibmvfc_crq_queue {
   604		struct ibmvfc_crq *msgs;
   605		int size, cur;
   606		dma_addr_t msg_token;
   607	};
   608	
   609	enum ibmvfc_ae_link_state {
   610		IBMVFC_AE_LS_LINK_UP		= 0x01,
   611		IBMVFC_AE_LS_LINK_BOUNCED	= 0x02,
   612		IBMVFC_AE_LS_LINK_DOWN		= 0x04,
   613		IBMVFC_AE_LS_LINK_DEAD		= 0x08,
   614	};
   615	
   616	enum ibmvfc_ae_fpin_status {
   617		IBMVFC_AE_FPIN_LINK_CONGESTED	= 0x1,
   618		IBMVFC_AE_FPIN_PORT_CONGESTED	= 0x2,
   619		IBMVFC_AE_FPIN_PORT_CLEARED	= 0x3,
   620		IBMVFC_AE_FPIN_PORT_DEGRADED	= 0x4,
   621	};
   622	
   623	struct ibmvfc_async_crq {
   624		volatile u8 valid;
   625		u8 link_state;
   626		u8 fpin_status
 > 627		u8 pad;
   628		__be32 pad2;
   629		volatile __be64 event;
   630		volatile __be64 scsi_id;
   631		volatile __be64 wwpn;
   632		volatile __be64 node_name;
   633		__be64 reserved;
   634	}__attribute__((packed, aligned (8)));
   635	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--d6Gm4EdcadzBjdND
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
wsslg0mvAQA=

--d6Gm4EdcadzBjdND--
