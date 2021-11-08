Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8744822B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 15:52:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnvGC6DDhz3bXj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 01:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnvFk4gbfz2x9R
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 01:51:34 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="232182589"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
 d="gz'50?scan'50,208,50";a="232182589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 06:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
 d="gz'50?scan'50,208,50";a="491245418"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 08 Nov 2021 06:50:26 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mk5yb-000CDd-Nd; Mon, 08 Nov 2021 14:50:25 +0000
Date: Mon, 8 Nov 2021 22:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Subject: Re: [PATCH v2] scsi: ibmvscsi: Use dma_alloc_noncoherent() instead
 of get_zeroed_page/dma_map_single()
Message-ID: <202111082218.Pyd9r2Qi-lkp@intel.com>
References: <20211012032317.2360-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20211012032317.2360-1-caihuoqing@baidu.com>
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
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cai,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.15 next-20211108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cai-Huoqing/scsi-ibmvscsi-Use-dma_alloc_noncoherent-instead-of-get_zeroed_page-dma_map_single/20211012-112447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ff4f34f9b1f3a0f14ed7472b8f4da0e12dc63d56
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cai-Huoqing/scsi-ibmvscsi-Use-dma_alloc_noncoherent-instead-of-get_zeroed_page-dma_map_single/20211012-112447
        git checkout ff4f34f9b1f3a0f14ed7472b8f4da0e12dc63d56
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_init_crq_queue':
>> drivers/scsi/ibmvscsi/ibmvscsi.c:336:21: error: 'struct crq_queue' has no member named 'msg'; did you mean 'msgs'?
     336 |         if (!queue->msg)
         |                     ^~~
         |                     msgs
   drivers/scsi/ibmvscsi/ibmvscsi.c:390:63: error: 'struct crq_queue' has no member named 'msg'; did you mean 'msgs'?
     390 |         dma_free_noncoherent(hostdata->dev, PAGE_SIZE, queue->msg,
         |                                                               ^~~
         |                                                               msgs


vim +336 drivers/scsi/ibmvscsi/ibmvscsi.c

   313	
   314	/**
   315	 * ibmvscsi_init_crq_queue() - Initializes and registers CRQ with hypervisor
   316	 * @queue:		crq_queue to initialize and register
   317	 * @hostdata:		ibmvscsi_host_data of host
   318	 * @max_requests:	maximum requests (unused)
   319	 *
   320	 * Allocates a page for messages, maps it for dma, and registers
   321	 * the crq with the hypervisor.
   322	 * Returns zero on success.
   323	 */
   324	static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
   325					   struct ibmvscsi_host_data *hostdata,
   326					   int max_requests)
   327	{
   328		int rc;
   329		int retrc;
   330		struct vio_dev *vdev = to_vio_dev(hostdata->dev);
   331	
   332		queue->size = PAGE_SIZE / sizeof(*queue->msgs);
   333		queue->msgs = dma_alloc_noncoherent(hostdata->dev,
   334						    PAGE_SIZE, &queue->msg_token,
   335						    DMA_BIDIRECTIONAL, GFP_KERNEL);
 > 336		if (!queue->msg)
   337			goto malloc_failed;
   338	
   339		gather_partition_info();
   340		set_adapter_info(hostdata);
   341	
   342		retrc = rc = plpar_hcall_norets(H_REG_CRQ,
   343					vdev->unit_address,
   344					queue->msg_token, PAGE_SIZE);
   345		if (rc == H_RESOURCE)
   346			/* maybe kexecing and resource is busy. try a reset */
   347			rc = ibmvscsi_reset_crq_queue(queue,
   348						      hostdata);
   349	
   350		if (rc == H_CLOSED) {
   351			/* Adapter is good, but other end is not ready */
   352			dev_warn(hostdata->dev, "Partner adapter not ready\n");
   353			retrc = 0;
   354		} else if (rc != 0) {
   355			dev_warn(hostdata->dev, "Error %d opening adapter\n", rc);
   356			goto reg_crq_failed;
   357		}
   358	
   359		queue->cur = 0;
   360		spin_lock_init(&queue->lock);
   361	
   362		tasklet_init(&hostdata->srp_task, (void *)ibmvscsi_task,
   363			     (unsigned long)hostdata);
   364	
   365		if (request_irq(vdev->irq,
   366				ibmvscsi_handle_event,
   367				0, "ibmvscsi", (void *)hostdata) != 0) {
   368			dev_err(hostdata->dev, "couldn't register irq 0x%x\n",
   369				vdev->irq);
   370			goto req_irq_failed;
   371		}
   372	
   373		rc = vio_enable_interrupts(vdev);
   374		if (rc != 0) {
   375			dev_err(hostdata->dev, "Error %d enabling interrupts!!!\n", rc);
   376			goto req_irq_failed;
   377		}
   378	
   379		return retrc;
   380	
   381	      req_irq_failed:
   382		tasklet_kill(&hostdata->srp_task);
   383		rc = 0;
   384		do {
   385			if (rc)
   386				msleep(100);
   387			rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
   388		} while ((rc == H_BUSY) || (H_IS_LONG_BUSY(rc)));
   389	      reg_crq_failed:
   390		dma_free_noncoherent(hostdata->dev, PAGE_SIZE, queue->msg,
   391				     queue->msg_token, DMA_BIDIRECTIONAL);
   392	      malloc_failed:
   393		return -1;
   394	}
   395	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--bp/iNruPH9dso1Pn
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
vQEA

--bp/iNruPH9dso1Pn--
