Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB42DFBC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 13:13:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czyzr6YQHzDqQ9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 23:13:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.180.222; helo=9.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 9.mo52.mail-out.ovh.net (9.mo52.mail-out.ovh.net
 [87.98.180.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czytx22XfzDqKP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 23:09:06 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 695F5227354;
 Mon, 21 Dec 2020 13:08:57 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 21 Dec
 2020 13:08:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0047275a6ac-0198-4f93-8c12-4b8715e7639d,
 0B619508FA83EFFE02DCDB9DB2C04BF8DACB1B13) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Mon, 21 Dec 2020 13:08:53 +0100
From: Greg Kurz <groug@kaod.org>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC Qemu PATCH v2 1/2] spapr: drc: Add support for async
 hcalls at the drc level
Message-ID: <20201221130853.15c8ddfd@bahia.lan>
In-Reply-To: <160674938210.2492771.1728601884822491679.stgit@lep8c.aus.stglabs.ibm.com>
References: <160674929554.2492771.17651548703390170573.stgit@lep8c.aus.stglabs.ibm.com>
 <160674938210.2492771.1728601884822491679.stgit@lep8c.aus.stglabs.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0df8e716-f94e-48de-ade1-7d540f1743ac
X-Ovh-Tracer-Id: 10401344817370339771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 linux-nvdimm@lists.01.org, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com,
 imammedo@redhat.com, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shiva,

On Mon, 30 Nov 2020 09:16:39 -0600
Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:

> The patch adds support for async hcalls at the DRC level for the
> spapr devices. To be used by spapr-scm devices in the patch/es to follow.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---

The overall idea looks good but I think you should consider using
a thread pool to implement it. See below.

>  hw/ppc/spapr_drc.c         |  149 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr_drc.h |   25 +++++++
>  2 files changed, 174 insertions(+)
> 
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 77718cde1f..4ecd04f686 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -15,6 +15,7 @@
>  #include "qapi/qmp/qnull.h"
>  #include "cpu.h"
>  #include "qemu/cutils.h"
> +#include "qemu/guest-random.h"
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
>  #include "migration/vmstate.h"
> @@ -421,6 +422,148 @@ void spapr_drc_detach(SpaprDrc *drc)
>      spapr_drc_release(drc);
>  }
>  
> +
> +/*
> + * @drc : device DRC targetting which the async hcalls to be made.
> + *
> + * All subsequent requests to run/query the status should use the
> + * unique token returned here.
> + */
> +uint64_t spapr_drc_get_new_async_hcall_token(SpaprDrc *drc)
> +{
> +    Error *err = NULL;
> +    uint64_t token;
> +    SpaprDrcDeviceAsyncHCallState *tmp, *next, *state;
> +
> +    state = g_malloc0(sizeof(*state));
> +    state->pending = true;
> +
> +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> +retry:
> +    if (qemu_guest_getrandom(&token, sizeof(token), &err) < 0) {
> +        error_report_err(err);
> +        g_free(state);
> +        qemu_mutex_unlock(&drc->async_hcall_states_lock);
> +        return 0;
> +    }
> +
> +    if (!token) /* Token should be non-zero */
> +        goto retry;
> +
> +    if (!QLIST_EMPTY(&drc->async_hcall_states)) {
> +        QLIST_FOREACH_SAFE(tmp, &drc->async_hcall_states, node, next) {
> +            if (tmp->continue_token == token) {
> +                /* If the token already in use, get a new one */
> +                goto retry;
> +            }
> +        }
> +    }
> +
> +    state->continue_token = token;
> +    QLIST_INSERT_HEAD(&drc->async_hcall_states, state, node);
> +
> +    qemu_mutex_unlock(&drc->async_hcall_states_lock);
> +
> +    return state->continue_token;
> +}
> +
> +static void *spapr_drc_async_hcall_runner(void *opaque)
> +{
> +    int response = -1;
> +    SpaprDrcDeviceAsyncHCallState *state = opaque;
> +
> +    /*
> +     * state is freed only after this thread finishes(after pthread_join()),
> +     * don't worry about it becoming NULL.
> +     */
> +
> +    response = state->func(state->data);
> +
> +    state->hcall_ret = response;
> +    state->pending = 0;
> +
> +    return NULL;
> +}
> +
> +/*
> + * @drc  : device DRC targetting which the async hcalls to be made.
> + * token : The continue token to be used for tracking as recived from
> + *         spapr_drc_get_new_async_hcall_token
> + * @func() : the worker function which needs to be executed asynchronously
> + * @data : data to be passed to the asynchronous function. Worker is supposed
> + *         to free/cleanup the data that is passed here

It'd be cleaner to pass a completion callback and have free/cleanup handled there.

> + */
> +void spapr_drc_run_async_hcall(SpaprDrc *drc, uint64_t token,
> +                               SpaprDrcAsyncHcallWorkerFunc *func, void *data)
> +{
> +    SpaprDrcDeviceAsyncHCallState *state;
> +
> +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> +    QLIST_FOREACH(state, &drc->async_hcall_states, node) {
> +        if (state->continue_token == token) {
> +            state->func = func;
> +            state->data = data;
> +            qemu_thread_create(&state->thread, "sPAPR Async HCALL",
> +                               spapr_drc_async_hcall_runner, state,
> +                               QEMU_THREAD_JOINABLE);

qemu_thread_create() exits on failure, it shouldn't be called on
a guest triggerable path, eg. a buggy guest could call it up to
the point that pthread_create() returns EAGAIN.

Please use a thread pool (see thread_pool_submit_aio()). This takes care
of all the thread housekeeping for you in a safe way, and it provides a
completion callback API. The implementation could then be just about
having two lists: one for pending requests (fed here) and one for
completed requests (fed by the completion callback).

> +            break;
> +        }
> +    }
> +    qemu_mutex_unlock(&drc->async_hcall_states_lock);
> +}
> +
> +/*
> + * spapr_drc_finish_async_hcalls
> + *      Waits for all pending async requests to complete
> + *      thier execution and free the states
> + */
> +static void spapr_drc_finish_async_hcalls(SpaprDrc *drc)
> +{
> +    SpaprDrcDeviceAsyncHCallState *state, *next;
> +
> +    if (QLIST_EMPTY(&drc->async_hcall_states)) {
> +        return;
> +    }
> +
> +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> +    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, next) {
> +        qemu_thread_join(&state->thread);

With a thread-pool, you'd just need to aio_poll() until the pending list
is empty and then clear the completed list.

> +        QLIST_REMOVE(state, node);
> +        g_free(state);
> +    }
> +    qemu_mutex_unlock(&drc->async_hcall_states_lock);
> +}
> +
> +/*
> + * spapr_drc_get_async_hcall_status
> + *      Fetches the status of the hcall worker and returns H_BUSY
> + *      if the worker is still running.
> + */
> +int spapr_drc_get_async_hcall_status(SpaprDrc *drc, uint64_t token)
> +{
> +    int ret = H_PARAMETER;
> +    SpaprDrcDeviceAsyncHCallState *state, *node;
> +
> +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> +    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, node) {
> +        if (state->continue_token == token) {
> +            if (state->pending) {
> +                ret = H_BUSY;
> +                break;
> +            } else {
> +                ret = state->hcall_ret;
> +                qemu_thread_join(&state->thread);

Like for qemu_thread_create(), the guest shouldn't be responsible for
thread housekeeping. Getting the hcall status should just be about
finding the token in the pending or completed lists.

> +                QLIST_REMOVE(state, node);
> +                g_free(state);
> +                break;
> +            }
> +        }
> +    }
> +    qemu_mutex_unlock(&drc->async_hcall_states_lock);
> +
> +    return ret;
> +}
> +
>  void spapr_drc_reset(SpaprDrc *drc)
>  {
>      SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> @@ -448,6 +591,7 @@ void spapr_drc_reset(SpaprDrc *drc)
>          drc->ccs_offset = -1;
>          drc->ccs_depth = -1;
>      }
> +    spapr_drc_finish_async_hcalls(drc);
>  }
>  
>  static bool spapr_drc_unplug_requested_needed(void *opaque)
> @@ -558,6 +702,7 @@ SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
>      drc->owner = owner;
>      prop_name = g_strdup_printf("dr-connector[%"PRIu32"]",
>                                  spapr_drc_index(drc));
> +

Unrelated change.

>      object_property_add_child(owner, prop_name, OBJECT(drc));
>      object_unref(OBJECT(drc));
>      qdev_realize(DEVICE(drc), NULL, NULL);
> @@ -577,6 +722,10 @@ static void spapr_dr_connector_instance_init(Object *obj)
>      object_property_add(obj, "fdt", "struct", prop_get_fdt,
>                          NULL, NULL, NULL);
>      drc->state = drck->empty_state;
> +
> +    qemu_mutex_init(&drc->async_hcall_states_lock);
> +    QLIST_INIT(&drc->async_hcall_states);
> +

Empty line not needed.

>  }
>  
>  static void spapr_dr_connector_class_init(ObjectClass *k, void *data)
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 165b281496..77f6e4386c 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -18,6 +18,7 @@
>  #include "sysemu/runstate.h"
>  #include "hw/qdev-core.h"
>  #include "qapi/error.h"
> +#include "block/thread-pool.h"
>  
>  #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
>  #define SPAPR_DR_CONNECTOR_GET_CLASS(obj) \
> @@ -168,6 +169,21 @@ typedef enum {
>      SPAPR_DRC_STATE_PHYSICAL_CONFIGURED = 8,
>  } SpaprDrcState;
>  
> +typedef struct SpaprDrc SpaprDrc;
> +
> +typedef int SpaprDrcAsyncHcallWorkerFunc(void *opaque);
> +typedef struct SpaprDrcDeviceAsyncHCallState {
> +    uint64_t continue_token;
> +    bool pending;
> +
> +    int hcall_ret;
> +    SpaprDrcAsyncHcallWorkerFunc *func;
> +    void *data;
> +
> +    QemuThread thread;
> +
> +    QLIST_ENTRY(SpaprDrcDeviceAsyncHCallState) node;
> +} SpaprDrcDeviceAsyncHCallState;
>  typedef struct SpaprDrc {
>      /*< private >*/
>      DeviceState parent;
> @@ -182,6 +198,10 @@ typedef struct SpaprDrc {
>      int ccs_offset;
>      int ccs_depth;
>  
> +    /* async hcall states */
> +    QemuMutex async_hcall_states_lock;
> +    QLIST_HEAD(, SpaprDrcDeviceAsyncHCallState) async_hcall_states;
> +
>      /* device pointer, via link property */
>      DeviceState *dev;
>      bool unplug_requested;
> @@ -241,6 +261,11 @@ void spapr_drc_detach(SpaprDrc *drc);
>  /* Returns true if a hot plug/unplug request is pending */
>  bool spapr_drc_transient(SpaprDrc *drc);
>  
> +uint64_t spapr_drc_get_new_async_hcall_token(SpaprDrc *drc);
> +void spapr_drc_run_async_hcall(SpaprDrc *drc, uint64_t token,
> +                               SpaprDrcAsyncHcallWorkerFunc, void *data);
> +int spapr_drc_get_async_hcall_status(SpaprDrc *drc, uint64_t token);
> +
>  static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
>  {
>      return drc->unplug_requested;
> 
> 
> 

